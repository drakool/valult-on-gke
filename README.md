# Vault on GKE
This project demonstrates the following:
1. Building go backend image app built with docker which, requires an apiKey to process the requests.
2. This apiKey is stored in HashiCorp Vault.
3. This vault is deployed among the rest of the prerequisites using terraform.

## Running the project
1. You need to export the mandatory parameter which is the GCP PROJECT_ID env variable.
2. Optionally, you can modify the terraform's other variables which are already set with default values.

