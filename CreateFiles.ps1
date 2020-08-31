. "./functions/Functions.ps1"

$numberOfDirectories = 200
$destinationRootDir = './out'
$sourceFilePath = './sourcefile/covid-positive-demographics.csv'

$ErrorActionPreference = "Stop"

$sourceFile = Get-Item $sourceFilePath
$extension = $sourceFile.Extension
$fileBaseName = $sourceFile.BaseName

# ----------------------------------
# make directories and files
# ----------------------------------
For ($i=1; $i -le $numberOfDirectories; $i++) {

    $newDir = "$destinationRootDir/$i"

    New-Item -Path $newDir -ItemType directory

    Copy-1000Files -SrcFilePath $sourceFilePath -FileName $fileBaseName -FileExtention $extension -DestDirectoryPath $newDir
}

