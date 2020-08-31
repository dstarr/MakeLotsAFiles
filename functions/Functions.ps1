# -------------------------------------
# Function to make 1000 unique files in a directory
# -------------------------------------
function Copy-1000Files {

    param (
        [Parameter(Mandatory = $true)]
        [String] $FileName,

        [Parameter(Mandatory = $true)]
        [String] $FileExtention,

        [Parameter(Mandatory = $true)]
        [String] $DestDirectoryPath,

        [Parameter(Mandatory = $true)]
        [String] $SrcFilePath
    )

    For ($i = 1; $i -le 1000; $i++) {

        $newBaseFileName = $FileName + "_" + $i + $FileExtention

        Copy-Item $SrcFilePath -Destination "$DestDirectoryPath/$newBaseFileName "
    }
}

# -------------------------------------
# Function to get all the containers  
# -------------------------------------
Function GetAllStorageContainer {  
    param (
        [Parameter(Mandatory = $true)]
        [String] $ResourceGroupName,

        [Parameter(Mandatory = $true)]
        [String] $StorageAccountName
    )

    Write-Host -ForegroundColor Green "Retrieving storage container.."      

    # Get the storage account from which container has to be retrieved  
    Write-Host "Get-AzStorageAccount" -StorageAccountName 
    $storageAccount = Get-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $StorageAccountName    
    
    # Get the storage account context  
    Write-Host "Get Storage Account Context"
    $ctx = $storageAccount.Context  


    # Write-Host ($ctx | ConvertTo-Json)
    
    # List all the containers  
    Write-Host "Get-AzStorageContainer"
    $containers = Get-AzStorageContainer -Context $ctx
    
    foreach ($container in $containers) {  
        Write-Host -ForegroundColor Yellow $container.Name  
    }  
}