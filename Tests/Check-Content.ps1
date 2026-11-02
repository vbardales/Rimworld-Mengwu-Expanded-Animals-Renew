param(
    [string]$ModPath = (Join-Path $PSScriptRoot '../Mod')
)
$ErrorActionPreference = 'Stop'
function Require($condition, [string]$message) { if (-not $condition) { throw $message } }
$ModPath = (Resolve-Path $ModPath).Path
$about = [xml](Get-Content (Join-Path $ModPath 'About/About.xml') -Raw -Encoding UTF8)
Require ($about.ModMetaData.packageId -ceq 'nelim.mengwuexpandedanimals') 'Save identity changed'
Require (@($about.ModMetaData.supportedVersions.li) -contains '1.6') 'Missing 1.6 support'
Require (@($about.ModMetaData.incompatibleWith.li) -contains 'SZ.MengGu.Expanded') 'Missing original-mod incompatibility warning'
Require (-not $about.ModMetaData.modDependencies) 'Unexpected required dependency; review Core-only contract'
Require ($about.ModMetaData.name.EndsWith(' (unofficial)')) 'Missing unofficial suffix'
Require ($about.ModMetaData.description.StartsWith('UNOFFICIAL.')) 'Missing unofficial notice'
Require ($about.ModMetaData.description.Trim().EndsWith('[url=' + $about.ModMetaData.url + ']Source code on GitHub[/url]')) 'Missing final GitHub link'
foreach ($dir in @('Assemblies','Source')) {
    Require (-not (Test-Path (Join-Path $ModPath $dir))) "New $dir content needs an expanded test/dependency audit"
}
# Optional integrations (AUDIT.md 4.f): exactly these three patches (Dogs mate ships its own for these defNames), each guarded, none a dependency.
$patchFiles = @(Get-ChildItem (Join-Path $ModPath 'Patches') -Filter '*.xml' | ForEach-Object Name | Sort-Object)
Require (($patchFiles -join ',') -ceq 'Compat_ADogSaidAnimalProsthetics2.xml,Compat_BetterCrossbreeding.xml,Compat_NocturnalAnimals.xml') "Unexpected patch set: $($patchFiles -join ',')"
foreach ($name in $patchFiles) {
    $p = [xml](Get-Content (Join-Path $ModPath "Patches/$name") -Raw -Encoding UTF8)
    $ops = @($p.Patch.Operation)
    Require ($ops.Count -eq 1) "One guarded operation expected: $name"
    Require ($p.SelectNodes('//*[@MayRequire or @MayRequireAny]').Count -eq 0) "MayRequire is read by nothing on an Operation: $name"
    Require ($ops[0].Class -in @('PatchOperationFindMod','PatchOperationConditional')) "Unguarded patch: $name"
    Require ($null -eq $ops[0].SelectSingleNode('nomatch')) "Top-level nomatch would act without the mod: $name"
}
Require (@($about.ModMetaData.loadBefore.li) -contains 'SamBucher.ADogSaidAnimalProsthetics2') 'ADS 2 patch needs loadBefore'
Require (-not (Test-Path (Join-Path $ModPath 'LoadFolders.xml'))) 'New load folders need a conditional-content audit'
$defs = [xml](Get-Content (Join-Path $ModPath 'Defs/MGAnimal.xml') -Raw -Encoding UTF8)
$nodes = @($defs.Defs.ChildNodes | Where-Object NodeType -eq Element)
Require ($nodes.Count -eq 8) 'Expected four animal races and four pawn kinds'
Require ($defs.SelectNodes('//*[@Class or @MayRequire or @MayRequireAny]|//MainButtonDef|//comps|//modExtensions').Count -eq 0) 'New custom integration needs explicit review'
Require ($defs.SelectNodes('//race/wildness').Count -eq 0) 'Obsolete race/wildness regression'
# alternateGraphicChance without a matching alternateGraphics list crashes pawn render init
# (TryGetAlternate -> TryRandomElementByWeight on an empty source), found by Pickle 2026-09-29.
foreach ($kind in $defs.SelectNodes('/Defs/PawnKindDef')) {
    if ($kind.alternateGraphicChance -and [double]$kind.alternateGraphicChance -gt 0) {
        Require ($kind.alternateGraphics -and @($kind.alternateGraphics.li).Count -gt 0) "alternateGraphicChance without alternateGraphics: $($kind.defName)"
    }
}
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
        if ($file.Name -eq 'ModIcon.png') { Require ($image.Width -eq 128 -and $image.Height -eq 128) 'Wrong icon dimensions' }
        if ($file.Name -eq 'Preview.png') {
            Require ($image.Width -eq 896 -and $image.Height -eq 504) 'Wrong Preview dimensions'
            Require ($file.Length -lt 1000000) 'Preview exceeds upload size limit'
        }
    } finally { $image.Dispose() }
}
# Display names no shared check owns: meatLabel sits outside Check-Translations' inventory, and race and pawn kind must carry one name.
$injected = @{}
foreach ($language in @('English','French')) {
    $injected[$language] = @{}
    foreach ($file in Get-ChildItem (Join-Path $ModPath "Languages/$language/DefInjected") -Recurse -Filter '*.xml') {
        foreach ($entry in ([xml](Get-Content $file.FullName -Raw -Encoding UTF8)).LanguageData.ChildNodes | Where-Object NodeType -eq Element) {
            $injected[$language][$file.Directory.Name + '/' + $entry.Name] = $entry.InnerText
        }
    }
}
foreach ($id in $wildness.Keys) {
    foreach ($language in $injected.Keys) {
        if ($defs.SelectSingleNode("/Defs/ThingDef[defName='$id']/race/meatLabel")) { Require ($injected[$language].ContainsKey("ThingDef/$id.race.meatLabel")) "Missing $language meatLabel: $id" }
        Require ($injected[$language]["ThingDef/$id.label"] -ceq $injected[$language]["PawnKindDef/$id.label"]) "Inconsistent animal name: $language $id"
    }
}
Write-Output "PASS: four Wildness regressions; race/life-stage/pack contracts; guarded patch set; $($pngs.Count) PNGs; animal names in both languages."
