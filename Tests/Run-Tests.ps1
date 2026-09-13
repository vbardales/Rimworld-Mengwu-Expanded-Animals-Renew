param(
    [string]$GameRoot = 'C:\Program Files (x86)\Steam\steamapps\common\RimWorld',
    [string]$InjectionChecker = (Join-Path $PSScriptRoot '../../scripts/Check-DefInjected.ps1')
)
$ErrorActionPreference = 'Stop'
$mod = (Resolve-Path (Join-Path $PSScriptRoot '../Mod')).Path
& (Join-Path $PSScriptRoot 'Check-Localization.ps1') -ModPath $mod
& (Join-Path $PSScriptRoot 'Check-Content.ps1') -ModPath $mod -GameData (Join-Path $GameRoot 'Data')
& (Join-Path $PSScriptRoot 'Test-RegressionGuards.ps1') -GameData (Join-Path $GameRoot 'Data')
if (-not (Test-Path $InjectionChecker)) { throw "Required injection checker unavailable: $InjectionChecker" }
# Separate process is needed by the shared reflection checker (Windows PowerShell/.NET Framework).
$injectionOutput = @(& powershell -NoProfile -ExecutionPolicy Bypass -File $InjectionChecker -TransMod $mod -GameData (Join-Path $GameRoot 'Data') -Managed (Join-Path $GameRoot 'RimWorldWin64_Data/Managed'))
$injectionExit = $LASTEXITCODE
$injectionOutput | Write-Output
if ($injectionExit -ne 0) { throw "Injection checker failed: exit $injectionExit" }
if (($injectionOutput -join "`n") -match 'UNVERIFIED') { throw 'Injection targets remain unverified' }
if (($injectionOutput -join "`n") -notmatch 'Keys checked: [1-9][0-9]* - errors: 0') { throw 'Missing successful injection summary' }
Write-Output 'PASS: all automated checks completed. No game process or functional scenario was run.'
