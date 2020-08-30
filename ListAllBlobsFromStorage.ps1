
# -------------------------------------
#  Fill in the following vairables
# -------------------------------------
$tenant=""
$subscription=""
$resourceGroupName=""  
$storageAccName=""  
 
# -------------------------------------
# Function to get all the containers  
# -------------------------------------
Function GetAllStorageContainer  
{  
    Write-Host -ForegroundColor Green "Retrieving storage container.."      

    # Get the storage account from which container has to be retrieved  
    $storageAcc = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccName      
    
    # Get the storage account context  
    $ctx = $storageAcc.Context  
    
    # List all the containers  
    $containers = Get-AzStorageContainer -Context $ctx   
    
    foreach($container in $containers)  
    {  
        Write-Host -ForegroundColor Yellow $container.Name  
    }  
}   

# comment this out if you want to just login on your command line
Connect-AzAccount -Tenant $tenant -Subscription $subscription

GetAllStorageContainer