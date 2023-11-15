# Terraform
The given Terraform creates Resource Group, under that Resource Group creates VNET, Public-IP, Subnet, NIC, windows Virtual Machine.

## Prerequisites
1. An Azure subscription.
2. Terraform 0.14.9 or later
3. The Azure CLI Tool installed

## Authenticate using the Azure CLI
#### az login
Your browser will open and prompt you to enter your Azure login credentials. After successful authentication, your terminal will display your subscription information.

Find the id column for the subscription account you want to use.

Once you have chosen the account subscription ID, set the account with the Azure CLI.
#### az account set --subscription "35akss-subscription-id"

## Create a Service Principal
Create a Service Principal. A Service Principal is an application within Azure Active Directory with the authentication tokens Terraform needs to perform actions on your behalf.
#### az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<SUBSCRIPTION_ID>"

## Set your environment variables
In your Powershell terminal, set the following environment variables. Be sure to update the variable values with the values Azure returned in the previous command.

#### $ $Env:ARM_CLIENT_ID = "<APPID_VALUE>"
#### $ $Env:ARM_CLIENT_SECRET = "<PASSWORD_VALUE>"
#### $ $Env:ARM_SUBSCRIPTION_ID = "<SUBSCRIPTION_ID>"
#### $ $Env:ARM_TENANT_ID = "<TENANT_VALUE>"

Now you are Ready to run terraform commands
1. Go to root directory where main.tf file present
2. Initialize Terraform Directory
#### terraform init
terraform init sets up the environment for your Terraform configuration to work, ensuring that you have the required plugins and modules, and that your backend configuration is properly initialized.

3. Validate the configuration 
#### terraform validate
The terraform validate command checks your Terraform configuration files for syntax and consistency errors. In short, it verifies that your configuration is correctly written and structured according to the HCL (HashiCorp Configuration Language) syntax and that it can be successfully processed by Terraform.

4. Plan you configuration
#### terraform plan 
The terraform plan command analyzes your Terraform configuration files and creates an execution plan. It compares the current state of your infrastructure with the desired state defined in your configuration files and outlines the changes required to achieve that desired state.

5. Apply your Configuration
#### terraform apply 
The terraform apply command is used to apply the changes specified in your Terraform execution plan to your infrastructure. 

6. Inspect the current state
#### terraform show
The terraform show command is used to display the current state and attributes of your infrastructure resources in a human-readable format. 

7. Destroy your Infrastructure
#### terraform destroy
The terraform destroy command is used to destroy and delete all resources managed by Terraform based on your configuration.

# Creating Azure Pipeline for Automaticully deploy resources

## Prerequisites
1. Azure Resource Manager Service Connection
2. Self Hosted or Microsoft Hosted Agent

### Azure Resource Manager Service Connection
-   Sign in to Azure DevOps:

-   Open your Azure DevOps organization (e.g., https://dev.azure.com/yourorganization).
    Navigate to Project Settings:

-   Click on the gear icon in the lower-left corner to access the project settings.
    Select Service connections:

-   In the Project Settings, find the "Service connections" option under the "Pipelines" section.
    Add a new service connection:

-   Click on the "New service connection" button.
    Choose the service connection type:

-   Select "Azure Resource Manager" from the list of service connection types.
    Configure the Azure Resource Manager service connection:

-   Fill in the required information:
    Connection Name: Provide a name for your service connection.
    Scope Level: Choose the scope level for the service connection (Subscription or Resource Group).
    Service principal client ID: This is the client ID of the service principal you create in Azure AD.
    Service principal key: This is the secret key associated with the service principal.
    Tenant ID: The Azure AD Tenant ID.
    Subscription ID: The ID of your Azure subscription.
    Authorize the service connection:

-   Click the "Authorize" button to sign in to Azure and authorize the service connection to access your Azure subscription.
    Verify and save the service connection:

-   After authorization, review the details and click the "Save" button.
    Grant permissions in Azure:

-   Depending on the scope level you selected, you might need to grant the necessary permissions in Azure for the service connection.
    Test the service connection:

-   After saving, you can click the "Verify" button to test the service connection.

### Self Hosted Agent
-   Navigate to Project Settings:

-   In your Azure DevOps project, go to "Project Settings."
    Select Agent Pools:

-   Under "Pipelines," select "Agent pools."
    Add pool Agent to link = new -> Self Hosted -> Give Name - Create
    
-   Download the Agent Package:
    In the Agent Pools page, select the agent pool where you want to add the agent. Click on "New agent" to download the agent package.
    Install the Agent:

    Link to download agent
    https://vstsagentpackage.azureedge.net/agent/3.230.0/vsts-agent-win-x64-3.230.0.zip

    Create directory and unzip agent package in that directory
    PS C:\> mkdir agent ; cd agent
    PS C:\agent> Add-Type -AssemblyName System.IO.Compression.FileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory("$HOME\Downloads\vsts-agent-win-x64-3.230.0.zip", "$PWD")

    Configure the agent
    PS C:\agent> .\config.cmd

    Run the agent interactively
    PS C:\agent> .\run.cmd

    In Agent Pools -> Agents
    You will see Agent online which we have configured now

-   Now you are ready to run pipeline from self hosted agent
