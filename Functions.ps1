function Write-1000Files {

    param (
        [Parameter(Mandatory=$true)]
        [String] $FileName,

        [Parameter(Mandatory=$true)]
        [String] $FileExtention,

        [Parameter(Mandatory=$true)]
        [String] $DirectoryPath
    )

    For ($i=1; $i -le 1000; $i++) {

        $newBaseFileName = $FileName + "_" + $i + $FileExtention

        New-Item -Path $DirectoryPath -ItemType file -Name $newBaseFileName
    }

}