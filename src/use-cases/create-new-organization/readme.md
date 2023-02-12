This use case is intended to use from the local machine
of the creator of the aws account with administrator credentials

- Create AWS account
- Create an admin user and copy access keys
- Create a bucket in that account called `[company-name]-infrastructure`
- Update the `provider.tf` file with your remote state bucket name
- Run this Terraform script changing the `variables.tf` file
- Follow the join instructions in the email received in the provided email
- Login on the new production account
- Create a `terraform` user with admin powers and access keys
- Create a bucket `[company-name]-production-infrastructure`
- That terraform user will be use in the pipelines of your production account

Once you are done you will have:

- A new production account under the workload organization unit
- A new admin user in sso
- A new admin group in sso
- A new admin permission set
- That admin group assigned to your root and production accounts

