param(
    [string]$sourcePath,
    [string]$replicaPath,
    [string]$logFilePath
)

# Function that logs the messages on the log file, creates the file if not exists
function Log($message) {
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logMessage = "$timestamp - $message"
    if (-not (Test-Path $logFilePath)) {
        New-Item -Path $logFilePath -ItemType File | Out-Null
    }
    Add-Content -Path $logFilePath -Value $logMessage
    Write-Output $logMessage
}

try {
    # Check if source folder exists, if not throws error
    if (-not (Test-Path $sourcePath -PathType Container)) {
        throw "Source folder does not exist."
    }

    # Check if replica folder exists, create it if not
    if (-not (Test-Path $replicaPath -PathType Container)) {
        New-Item -Path $replicaPath -ItemType Directory | Out-Null
        Log "Replica folder created."
    }

    # Synchronize folders
    $sourceFiles = Get-ChildItem -Path $sourcePath -Recurse
    $replicaFiles = Get-ChildItem -Path $replicaPath -Recurse

    # Remove all files in the replica folder
    Get-ChildItem -Path $replicaPath -File | ForEach-Object {
        Remove-Item -Path $_.FullName -Force
        Log "Removed file: $($_.FullName)"
    }

    # Copy or Update files from source folder to the replica folder
    foreach ($sourceFile in $sourceFiles) {
        $replicaFilePath = $replicaPath + $sourceFile.FullName.Substring($sourcePath.Length)
        Copy-Item -Path $sourceFile.FullName -Destination $replicaFilePath -Force -ErrorAction SilentlyContinue
        Log "Copied file: $($sourceFile.FullName)"
    }

    Log "Synchronization completed successfully."

} catch {
    Log "Error: $_"
}


