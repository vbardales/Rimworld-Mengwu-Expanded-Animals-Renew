param([string]$ModPath = (Join-Path $PSScriptRoot '../Mod'))
$ErrorActionPreference = 'Stop'
$expected = @{}
$docs = @(Get-ChildItem $ModPath -Recurse -Filter '*.xml')
foreach ($file in $docs) { $null = [xml](Get-Content $file.FullName -Raw -Encoding UTF8) }
foreach ($file in Get-ChildItem (Join-Path $ModPath 'Defs') -Recurse -Filter '*.xml') {
    $xml = [xml](Get-Content $file.FullName -Raw -Encoding UTF8)
    foreach ($def in $xml.Defs.ChildNodes | Where-Object NodeType -eq Element) {
        foreach ($leaf in $def.SelectNodes('.//*[not(*)]')) {
            # Inventory owned display fields, including nested labels, independently of translations.
            if ($leaf.Name -notin @('label','description','labelMale','labelFemale','meatLabel') -and
                $leaf.InnerText -notmatch '[\p{IsCJKUnifiedIdeographs}]') { continue }
            $parts = @()
            $node = $leaf
            while ($node -ne $def) {
                if ($node.Name -eq 'li') {
                    $siblings = @($node.ParentNode.ChildNodes | Where-Object NodeType -eq Element)
                    $index = 0
                    while ($siblings[$index] -ne $node) { $index++ }
                    $parts = @([string]$index) + $parts
                } else { $parts = @($node.Name) + $parts }
                $node = $node.ParentNode
            }
            $key = $def.Name + '/' + $def.defName + '.' + ($parts -join '.')
            if ($expected.ContainsKey($key)) { throw "Duplicate source field: $key" }
            $expected[$key] = $leaf.InnerText
        }
    }
}
if ($expected.Count -eq 0) { throw 'Empty display-text inventory' }
$inventories = @{}
foreach ($language in @('English','French')) {
    $actual = @{}
    foreach ($file in Get-ChildItem (Join-Path $ModPath "Languages/$language/DefInjected") -Recurse -Filter '*.xml') {
        $xml = [xml](Get-Content $file.FullName -Raw -Encoding UTF8)
        foreach ($entry in $xml.LanguageData.ChildNodes | Where-Object NodeType -eq Element) {
            $key = $file.Directory.Name + '/' + $entry.Name
            if ($actual.ContainsKey($key)) { throw "Duplicate $language key: $key" }
            $value = $entry.InnerText
            if ([string]::IsNullOrWhiteSpace($value) -or $value -match '(?i)TODO|TBD|PLACEHOLDER|\p{IsCJKUnifiedIdeographs}') { throw "Untranslated $language value: $key" }
            if ($value -match '\\(?!n)') { throw "Invalid escaped line break: $language $key" }
            if ($value -match '[{}<>]') { throw "New formatting token requires review: $language $key" }
            if (-not $expected.ContainsKey($key)) { throw "Injection targets an unowned field: $language $key" }
            $actual[$key] = $value
        }
    }
    foreach ($key in $expected.Keys) {
        if (-not $actual.ContainsKey($key)) { throw "Missing $language field: $key" }
    }
    $inventories[$language] = $actual
    Write-Output "$language coverage: $($actual.Count)/$($expected.Count); no duplicate, empty, placeholder or malformed values."
}
foreach ($id in @('MG_Horse','MG_TiaoShu','MG_TuSun','MG_TuBoShu')) {
    foreach ($language in $inventories.Keys) {
        if ($inventories[$language]["ThingDef/$id.label"] -ne $inventories[$language]["PawnKindDef/$id.label"]) {
            throw "Inconsistent animal name: $language $id"
        }
    }
}
Write-Output "PASS: $($docs.Count) XML files parsed; $($expected.Count) owned display fields covered in both languages."
