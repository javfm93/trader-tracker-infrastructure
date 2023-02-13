# Self-service terraform infrastructure

This is the base infrastructure repository of your company,
the target of this repository is to provide the building blocks
for any application in your company, enabling quick provision
to the development team for the most common use cases, but, at
the same time, given them the flexibility to build their own
custom infrastructure if necessary

## Structure

The project is divided in modules that are divided by responsibility,
each of these modules are compose by:

- **Components**: Fine grain concept (alb, subnet, rds...etc).
- **Use cases**: Composition of components in the module.

Lastly, there is a top level **use-cases** folder that is divided into layers:

- **Layer 0 - admin**: This is infrastructure that is intended to run only in the
  local machine of an administrator, it controls the account management and
  user management. This Infrastructure will run very rarely and for the root account.


- **Level 1 - core**: Infrastructure that is common and necessary for multiple
  aws services (vpc, ecs clusters...etc). Infrastructure here will run not run often
  but will be required to run in all your environments/workload accounts.


- **Level 3 - application**: This high level use cases are intended to be imported
  by the development teams and enable then to quickly provision the infra needed to
  develop an application. This modules will be use multiple times and by multiple teams
  so, the version control and breaking changes on them are a sensible topic.

## How to use these modules to self-service application infrastructure

You always will need to import in your project the common infrastructure
of the account for all the applications:

```terraform
data "terraform_remote_state" "core" {
  backend = "s3"

  config = {
    bucket = "[company-name]-infrastructure"
    key    = "core.tfstate"
    region = "[region]"
  }
}
```

After that, you can quickly leverage the next use cases:

### Create new internet exposed backend (ecs cluster)

```terraform
module "public-backend" {
  source           = "git::https://github.com/javfm93/trader-tracker-infrastructure.git//src/use-cases/L2-application/create-new-backend"
  app_name         = var.app_name
  cluster_name     = var.cluster_name
  app_port         = var.app_port
  cluster_id       = data.terraform_remote_state.core.outputs.cluster_id
  desired_tasks    = 1
  region           = var.region
  ssm_parameters   = []
  vpc_id           = data.terraform_remote_state.core.outputs.vpc_id
  app_target_group = var.app_target_group
  alb              = data.terraform_remote_state.core.outputs.public_alb
  subnets_id       = data.terraform_remote_state.core.outputs.public_subnets_ids
  public_key_path  = local.public_key_path
}
```

### Create an internal backend

```terraform
module "create-new-backend" {
  source           = "git::https://github.com/javfm93/trader-tracker-infrastructure.git//src/use-cases/L2-application/create-new-backend"
  app_name         = var.app_name
  cluster_name     = var.app_name
  app_port         = var.app_port
  cluster_id       = data.terraform_remote_state.core.outputs.cluster_id
  desired_tasks    = 1
  region           = var.region
  ssm_parameters   = local.parameters
  vpc_id           = data.terraform_remote_state.core.outputs.vpc_id
  app_target_group = var.app_target_group
  alb              = data.terraform_remote_state.core.outputs.private_alb
  subnets_id       = data.terraform_remote_state.core.outputs.private_subnets_ids
  public_key_path  = local.public_key_path
}
```

/*
repos:
1 infra shared --> /infra/core.tf credenciales -->
1 repo por application que creas --> /infra/app-name.tf
*/
