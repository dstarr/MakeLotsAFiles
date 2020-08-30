## Create a lot of files

This is a simple script that creates a lot of files based on an input file. It creates n folders with 1000 files per folder.

## CreateFiles.ps1

1. Tweak the variables at the top of the script for your desired usage.
1. Run the script in PowerShell.

* works on Mac all platform version of PowerShell

## Uploading to file storage

Should you wish to upload your files to Azure Blob Storage, do the following.

1. Install AzCopy
1. Use the following steps to upload data to a container

### get a SAS token for the container
``` bash 
az storage container generate-sas --account-name STORAGE_ACCOUNT_NAME --expiry 2021-01-01 --name CONTAINER_NAME --permission acdlrw
```

### replace the SAS token and other values needed then run

```bash
azcopy copy "LOCAL_SOURCE_FOLDER/*" "https://STORAGE_ACCOUNT_NAME.blob.core.windows.net/CONTAINER_NAME/?SAS_TOKEN" --recursive=true
```

**EXAMPLE**

```bash
azcopy copy "./out/*" "https://myStorageAccount.blob.core.windows.net/myContainer/?[SAS_TOKEN]" --recursive=true
```

