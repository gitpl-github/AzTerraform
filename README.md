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
