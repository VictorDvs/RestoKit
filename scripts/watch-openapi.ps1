# Chemins
$pathFr = "docs/fr/api"
$pathEn = "docs/en/api"
$openapiFile = "openapi.yaml"
$outputFr = "$pathFr/restokit-api.html"
$outputEn = "$pathEn/restokit-api.html"

# Fonction pour générer la doc
function Generate-RedocFr {
    Write-Host "`n[Génération FR] Documentation Redoc..."
    npx @redocly/cli build-docs "$pathFr/$openapiFile" -o "$outputFr" --title "API RestoKit (FR)" --disableGoogleFont
    Write-Host "✅ Documentation FR générée dans $outputFr"
}

function Generate-RedocEn {
    Write-Host "`n[Génération EN] Documentation Redoc..."
    npx @redocly/cli build-docs "$pathEn/$openapiFile" -o "$outputEn" --title "RestoKit API (EN)" --disableGoogleFont
    Write-Host "✅ Documentation EN générée dans $outputEn"
}

# Génération initiale
Generate-RedocFr
Generate-RedocEn

# Création des watchers
$fswFr = New-Object System.IO.FileSystemWatcher $pathFr, $openapiFile
$fswFr.EnableRaisingEvents = $true
$fswFr.NotifyFilter = [System.IO.NotifyFilters]'LastWrite'

$fswEn = New-Object System.IO.FileSystemWatcher $pathEn, $openapiFile
$fswEn.EnableRaisingEvents = $true
$fswEn.NotifyFilter = [System.IO.NotifyFilters]'LastWrite'

# Événements
Register-ObjectEvent $fswFr Changed -Action {
    Write-Host "`n[Watcher FR] Changement détecté, régénération..."
    Generate-RedocFr
}

Register-ObjectEvent $fswEn Changed -Action {
    Write-Host "`n[Watcher EN] Changement détecté, régénération..."
    Generate-RedocEn
}

Write-Host "`n👀 Watchers actifs sur les fichiers FR et EN. Appuyez sur Ctrl+C pour arrêter."
while ($true) { Start-Sleep -Seconds 1 }
