
# -------------------------------------
#  Fill in the following vairables
# -------------------------------------
$tenant=""
$subscription=""

$resourceGroupName=""
$storageAccountName=""
 
# -------------------------------------
# Function to get all the containers  
# -------------------------------------
Function GetAllStorageContainer  
{  
    Write-Host -ForegroundColor Green "Retrieving storage container.."      

    # Get the storage account from which container has to be retrieved  
    Write-Host "New-AzStorageAccount" -StorageAccountName 
    $storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName    
    
    # Get the storage account context  
    Write-Host "Get Storage Account Context"
    $ctx = $storageAccount.Context  
    
    # List all the containers  
    Write-Host "Get-AzStorageContainer"
    $containers = Get-AzStorageContainer -Context $ctx   
    
    foreach($container in $containers)  
    {  
        Write-Host -ForegroundColor Yellow $container.Name  
    }  
}   
  

# Comment out the following line if you are already logged in
Connect-AzAccount -Tenant $tenant -Subscription $subscription

GetAllStorageContainer