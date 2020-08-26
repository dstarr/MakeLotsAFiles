. "./functions/Functions.ps1"

$sourceFilePath = './sourcefile/covid-positive-demographics.csv'
$destinationRootDir = './out'

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
For ($i=1; $i -le 200; $i++) {

    $newDir = "$destinationRootDir/$i"

    New-Item -Path $newDir -ItemType directory

    Write-1000Files -FileName $fileBaseName -FileExtention $extension -DirectoryPath $newDir
}
