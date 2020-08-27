function Copy-1000Files {

    param (
        [Parameter(Mandatory=$true)]
        [String] $FileName,

        [Parameter(Mandatory=$true)]
        [String] $FileExtention,

        [Parameter(Mandatory=$true)]
        [String] $DestDirectoryPath,

        [Parameter(Mandatory=$true)]
        [String] $SrcFilePath
    )

    For ($i=1; $i -le 1000; $i++) {

        $newBaseFileName = $FileName + "_" + $i + $FileExtention

        Copy-Item $SrcFilePath -Destination "$DestDirectoryPath/$newBaseFileName "
    }

}