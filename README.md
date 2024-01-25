# Folder Synchronization PowerShell Script

## Overview
This PowerShell script is designed to synchronize two folders: a source folder and a replica folder. The script ensures that the content of the replica folder exactly matches the content of the source folder in a one-way synchronization.

## Features
- One-way synchronization from source to replica.
- Logs file creation, copying, and removal operations to a specified log file and console output.
- Accepts folder paths and log file path as command line arguments.
- Does not use `robocopy` or similar utilities.

## Usage
1. **Download the Script:**
   - Download the `FolderSync.ps1` script from this repository.

2. **Open PowerShell:**
   - Open a PowerShell session with administrator privileges.

3. **Set Execution Policy:**
   - If necessary, set the execution policy to allow script execution. Run the following command:
     ```powershell
     Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
     ```

4. **Run the Script:**
   - Navigate to the folder containing the script and run the following command, replacing the paths with your actual source, replica, and log file paths:
     ```powershell
     .\FolderSync.ps1 -sourcePath "C:\Path\To\Source" -replicaPath "C:\Path\To\Replica" -logFilePath "C:\Path\To\Log\File.txt"
     ```

5. **Review Log Output:**
   - The script will display the synchronization progress in the console and log detailed information to the specified log file.

## Important Notes
- Ensure that the source folder exists before running the script.
- The replica folder will be created if it does not already exist.
- The script uses a one-way synchronization method, updating the replica to match the source.

## Example
```powershell
.\FolderSync.ps1 -sourcePath "C:\Users\Username\Documents\SourceFolder" -replicaPath "D:\Backup\ReplicaFolder" -logFilePath "C:\Users\Username\Documents\Logs\SyncLog.txt"
