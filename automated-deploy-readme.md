# Automated RKE2 + Big Bang DSOP deployment to Azure

This readme describes how to deploy DoD DSOP (RKE2 and Big Bang) to Azure using automation provided by GitHub Actions stored in this repository.

## Step 1: Create GH secrets for required credentials

The following GH repository secrets are required for this to work:

- `AZURE_CREDENTIALS` - A Service Principal with Owner role on your target subscription. This can be accomplished using the following command via bash with an authenticated azcli, and copying the output into this Secret. More info [here](https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli).

```bash
az ad sp create-for-rbac --name "<principal name>" --role owner --scopes /subscriptions/<subscription_id> --sdk-auth
```

- `GH_PAT` - GitHub Personal Access Token. See [docs](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token).
- `IRON_BANK_USER` - Iron Bank User name. Get from Iron Bank profile.
- `IRON_BANK_PAT` - Iron Bank Personal Access Token. Get from Iron Bank profile.

## Step 2: Create a new branch for your deployment

Create a branch from main to store configuration for your particular environment. We recommend using the branch naming convention of `env/<env-name>`.

## Step 3: Update configuration

Edit `config.json`. In particular, ensure you update the `cluster_name` value. Currently this deployment approach does not support repeat or updated deployments in place.

Commit your changes to `config.json` directly to your env branch.

## Step 4: Sit back and watch it happen

Click the Actions tab and watch your deployment take happen. It takes between 5-10 minutes depending on the size of your cluster.