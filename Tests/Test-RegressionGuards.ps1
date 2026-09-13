param([string]$GameData = 'C:\Program Files (x86)\Steam\steamapps\common\RimWorld\Data')
$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$scratch = Join-Path $root ('.build/regression-guards-' + [guid]::NewGuid().ToString('N'))
$utf8 = [Text.UTF8Encoding]::new($false)
$cases = @('missing-french','wrong-head-target','legacy-wildness','missing-texture')
foreach ($case in $cases) {
    $dir = Join-Path $scratch $case
    New-Item -ItemType Directory -Path $dir -Force | Out-Null
    Copy-Item -LiteralPath (Join-Path $root 'Mod') -Destination $dir -Recurse
    Copy-Item -LiteralPath (Join-Path $root 'ATTRIBUTION.md') -Destination $dir
    $mod = Join-Path $dir 'Mod'
    if ($case -eq 'missing-french') {
        $file = Join-Path $mod 'Languages/French/DefInjected/ThingDef/Mengwu_Animals.xml'
        $text = [IO.File]::ReadAllText($file)
        [IO.File]::WriteAllText($file, [regex]::Replace($text,'\s*<MG_Horse.race.meatLabel>.*?</MG_Horse.race.meatLabel>',''),$utf8)
        $expected = 'Missing French field'
    } elseif ($case -eq 'wrong-head-target') {
        $file = Join-Path $mod 'Languages/English/DefInjected/ThingDef/Mengwu_Animals.xml'
        [IO.File]::WriteAllText($file,[IO.File]::ReadAllText($file).Replace('MG_TuSun.tools.3.label','MG_TuSun.tools.2.label'),$utf8)
        $expected = 'Injection targets an unowned field'
    } elseif ($case -eq 'legacy-wildness') {
        $file = Join-Path $mod 'Defs/MGAnimal.xml'
        $text = [IO.File]::ReadAllText($file).Replace('<Wildness>0.1</Wildness>','')
        $text = $text.Replace('<packAnimal>true</packAnimal>','<wildness>0.1</wildness><packAnimal>true</packAnimal>')
        [IO.File]::WriteAllText($file,$text,$utf8)
        $expected = 'Obsolete race/wildness regression'
    } else {
        $file = Join-Path $mod 'Textures/Things/Animal/TiaoTu/TiaoTu_north.png'
        Rename-Item -LiteralPath $file -NewName 'TiaoTu_north.missing'
        $expected = 'Missing north texture'
    }
    $observed = $null
    try {
        if ($case -in @('missing-french','wrong-head-target')) {
            & (Join-Path $PSScriptRoot 'Check-Localization.ps1') -ModPath $mod | Out-Null
        } else {
            & (Join-Path $PSScriptRoot 'Check-Content.ps1') -ModPath $mod -GameData $GameData | Out-Null
        }
    } catch { $observed = $_.Exception.Message }
    if (-not $observed -or $observed -notlike "*$expected*") { throw "Guard $case failed to detect intended regression: $observed" }
    Write-Output "PASS guard ${case}: rejected with '$observed'"
}
Write-Output 'PASS: four deliberate regressions rejected in isolated copies; shipped files untouched.'
