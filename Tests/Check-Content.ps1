param(
    [string]$ModPath = (Join-Path $PSScriptRoot '../Mod'),
    [string]$GameData = 'C:\Program Files (x86)\Steam\steamapps\common\RimWorld\Data'
)
$ErrorActionPreference = 'Stop'
function Require($condition, [string]$message) { if (-not $condition) { throw $message } }
$ModPath = (Resolve-Path $ModPath).Path
$core = Join-Path $GameData 'Core/Defs'
Require (Test-Path $core) "Core definitions unavailable: $core"
$about = [xml](Get-Content (Join-Path $ModPath 'About/About.xml') -Raw -Encoding UTF8)
Require ($about.ModMetaData.packageId -ceq 'nelim.mengwuexpandedanimalsrenew') 'Save identity changed'
Require (@($about.ModMetaData.supportedVersions.li) -contains '1.6') 'Missing 1.6 support'
Require (@($about.ModMetaData.incompatibleWith.li) -contains 'SZ.MengGu.Expanded') 'Missing original-mod incompatibility warning'
Require (-not $about.ModMetaData.modDependencies) 'Unexpected required dependency; review Core-only contract'
Require ($about.ModMetaData.name.EndsWith(' (unofficial)')) 'Missing unofficial suffix'
Require ($about.ModMetaData.description.StartsWith('UNOFFICIAL.')) 'Missing unofficial notice'
Require ($about.ModMetaData.description.Trim().EndsWith('[url=' + $about.ModMetaData.url + ']Source code on GitHub[/url]')) 'Missing final GitHub link'
foreach ($dir in @('Assemblies','Source','Patches')) {
    Require (-not (Test-Path (Join-Path $ModPath $dir))) "New $dir content needs an expanded test/dependency audit"
}
Require (-not (Test-Path (Join-Path $ModPath 'LoadFolders.xml'))) 'New load folders need a conditional-content audit'
$defs = [xml](Get-Content (Join-Path $ModPath 'Defs/MGAnimal.xml') -Raw -Encoding UTF8)
$nodes = @($defs.Defs.ChildNodes | Where-Object NodeType -eq Element)
Require ($nodes.Count -eq 8) 'Expected four animal races and four pawn kinds'
Require (@($nodes | Group-Object { $_.Name + '/' + $_.defName } | Where-Object Count -gt 1).Count -eq 0) 'Duplicate typed defName'
Require ($defs.SelectNodes('//*[@Class or @MayRequire or @MayRequireAny]|//MainButtonDef|//comps|//modExtensions').Count -eq 0) 'New custom integration needs explicit review'
Require ($defs.SelectNodes('//race/wildness').Count -eq 0) 'Obsolete race/wildness regression'
$wildness = @{ MG_Horse = '0.1'; MG_TiaoShu = '0.35'; MG_TuSun = '0.35'; MG_TuBoShu = '0.6' }
foreach ($id in $wildness.Keys) {
    $race = $defs.SelectSingleNode("/Defs/ThingDef[defName='$id']")
    $kind = $defs.SelectSingleNode("/Defs/PawnKindDef[defName='$id']")
    Require ($null -ne $race -and $null -ne $kind) "Missing animal: $id"
    Require ($race.statBases.Wildness -ceq $wildness[$id]) "Wildness port regression: $id"
    Require ($kind.race -ceq $id) "Pawn kind uses the wrong race: $id"
    Require (@($race.race.lifeStageAges.li).Count -eq @($kind.lifeStages.li).Count) "Life-stage graphics mismatch: $id"
    $ages = @($race.race.lifeStageAges.li | ForEach-Object { [double]::Parse($_.minAge, [Globalization.CultureInfo]::InvariantCulture) })
    Require ($ages[0] -eq 0) "Missing birth stage: $id"
    for ($i=1; $i -lt $ages.Count; $i++) { Require ($ages[$i] -gt $ages[$i-1]) "Non-increasing life-stage ages: $id" }
}
$horse = $defs.SelectSingleNode("/Defs/ThingDef[defName='MG_Horse']")
Require ($horse.race.packAnimal -ceq 'true') 'Horse lost pack-animal functionality'
Require ($horse.race.trainability -ceq 'Advanced') 'Horse training contract changed'

# Resolve references against installed Core only, so DLC cannot mask a missing dependency.
$names = @{}; $parents = @{}
foreach ($file in Get-ChildItem $core -Recurse -Filter '*.xml') {
    $xml = [xml](Get-Content $file.FullName -Raw -Encoding UTF8)
    foreach ($node in $xml.DocumentElement.ChildNodes | Where-Object NodeType -eq Element) {
        if ($node.defName) { $names[[string]$node.defName] = $true }
        if ($node.GetAttribute('Name')) { $parents[$node.GetAttribute('Name')] = $true }
    }
}
foreach ($node in $nodes) {
    $names[[string]$node.defName] = $true
    Require ($parents[$node.ParentName]) "Unresolved Core parent: $($node.ParentName)"
}
$paths = '//statBases/*|//race/body|//race/leatherDef|//race/trainability|//race/lifeStageAges/li/def|//race/lifeStageAges/li/soundWounded|//race/lifeStageAges/li/soundDeath|//race/lifeStageAges/li/soundCall|//race/lifeStageAges/li/soundAngry|//race/soundMeleeHitPawn|//race/soundMeleeHitBuilding|//race/soundMeleeMiss|//tools/li/capacities/li|//tools/li/linkedBodyPartsGroup|//wildBiomes/*|/Defs/PawnKindDef/race'
$refs = @($defs.SelectNodes($paths))
foreach ($node in $refs) {
    $key = if ($node.ParentNode.Name -in @('statBases','wildBiomes')) { $node.Name } else { $node.InnerText }
    Require ($names[$key]) "Unresolved Core/local reference: $key"
}
# Core graphics are packed game assets; verify custom PNGs here, rendering later in game.
$prefixes = @($defs.SelectNodes('//texPath') | ForEach-Object InnerText | Sort-Object -Unique)
foreach ($prefix in $prefixes | Where-Object { $_ -like 'Things/Animal/*' }) {
    $base = Join-Path (Join-Path $ModPath 'Textures') $prefix
    $files = @(Get-ChildItem ($base + '*.png') | Where-Object { $_.BaseName -match ('^' + [regex]::Escape((Split-Path $base -Leaf)) + '(_(north|east|south|west))?$') })
    Require ($files.Count -gt 0) "Missing custom texture: $prefix"
    if ($prefix -notlike '*Dessicated*') {
        foreach ($direction in @('north','east','south')) { Require (Test-Path ($base + '_' + $direction + '.png')) "Missing $direction texture: $prefix" }
    }
}
Add-Type -AssemblyName System.Drawing
$pngs = @(Get-ChildItem $ModPath -Recurse -Filter '*.png')
foreach ($file in $pngs) {
    $image = [Drawing.Image]::FromFile($file.FullName)
    try {
        Require ($image.RawFormat.Guid -eq [Drawing.Imaging.ImageFormat]::Png.Guid) "Not a PNG: $($file.Name)"
        if ($file.Name -eq 'ModIcon.png') { Require ($image.Width -eq 128 -and $image.Height -eq 128) 'Wrong icon dimensions' }
        if ($file.Name -eq 'Preview.png') {
            Require ($image.Width -eq 896 -and $image.Height -eq 504) 'Wrong Preview dimensions'
            Require ($file.Length -lt 1000000) 'Preview exceeds upload size limit'
        }
    } finally { $image.Dispose() }
}
foreach ($name in @('ModIcon.png','Preview.png')) { Require (Test-Path (Join-Path $ModPath "About/$name")) "Missing About image: $name" }
Require ((Get-FileHash (Join-Path $ModPath 'ATTRIBUTION.md')).Hash -eq (Get-FileHash (Join-Path $ModPath '../ATTRIBUTION.md')).Hash) 'Distributed attribution is stale'
Write-Output "PASS: four Wildness regressions; race/life-stage/pack contracts; $($refs.Count) Core/local references; $($pngs.Count) PNGs; distribution metadata."
