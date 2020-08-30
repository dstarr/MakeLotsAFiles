. "./functions/Functions.ps1"

$sourceFilePath = './sourcefile/covid-positive-demographics.csv'
$destinationRootDir = './out'
$numberOfDirectories = 300

$sourceFile = Get-Item $sourceFilePath
$extension = $sourceFile.Extension
$fileBaseName = $sourceFile.BaseName


# if old out files exists, delete them
if(Test-Path -Path $destinationRootDir) {
    Write-Host "Removing Old Directory..."
    Remove-Item -Path $destinationRootDir -Recurse
    New-Item -Path $destinationRootDir -ItemType directory
}

# make directories and files
For ($i=1; $i -le $numberOfDirectories; $i++) {

    $newDir = "$destinationRootDir/$i"

    New-Item -Path $newDir -ItemType directory

    Copy-1000Files -SrcFilePath $sourceFilePath -FileName $fileBaseName -FileExtention $extension -DestDirectoryPath $newDir
}
