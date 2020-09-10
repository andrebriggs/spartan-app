# spartan-app

## GitHub Action Setup

Add a secret `AZURE_CREDENTIALS` as mentioned [here](https://github.com/marketplace/actions/azure-cli-action#configure-azure-credentials-as-github-secret)

Associate Service Principal with ACR to be able to push to ACR

```bash
ACR_REGISTRY_ID=$(az acr show --name $ACR_NAME --query id --output tsv)
az role assignment create --assignee $SERVICE_PRINCIPAL_ID --scope $ACR_REGISTRY_ID --role acrpush
```

Other secrets to add:

* __HLD_REPO_SECRET__ - GitHub Personal Access Token
* __INTROSPECTION_ACCOUNT_KEY__ - Azure Stroage Account Key
* __REGISTRY_LOGIN_SERVER__ - (ACRNAME).azurecr.io
* __REGISTRY_PASSWORD__ - SP Password
* __REGISTRY_USERNAME__ - SP Client Id