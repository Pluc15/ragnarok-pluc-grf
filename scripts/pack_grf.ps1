

$basePath = Join-Path $PSScriptRoot ".." | Resolve-Path
$dataRevenantPath = Join-Path $basePath "data_revenant"
$dataPath = Join-Path $basePath "data"
$dataFolders = @(
    "data_lgp",
    "data_maps",
    "data_min_effect",
    "data_misc",
    "data_mvp"
)

Write-Output "=> Deleting old data directory"
if (Test-Path $dataPath) {
    Remove-Item -Recurse -Force $dataPath
}

Write-Output "=> Creating new data directory"
New-Item -ItemType Directory -Path $dataPath

Write-Output "=> Merging all the data folders"
foreach ($folder in $dataFolders) {
    $src = Join-Path $basePath $folder
    if (Test-Path $src) {
        Copy-Item "$src\*" $dataPath\ -Recurse -Force
    }
    else {
        Write-Warning "Folder not found: $folder"
    }
}

Write-Output "=> Packing the full grf"
& (Join-Path $basePath "scripts/GrfCL.exe") -breakOnExceptions true -makeGrf (Join-Path $basePath "dist/pluc.grf") $dataPath
Write-Output "=> Packing server specific grfs"
& (Join-Path $basePath "scripts/GrfCL.exe") -breakOnExceptions true -makeGrf (Join-Path $basePath "dist/pluc_revenant.grf") $dataRevenantPath
