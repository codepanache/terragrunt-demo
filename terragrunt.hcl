remote_state {
  backend = "gcs"
  config = {
    bucket = "terragrunt-demo"
    
    prefix = "${path_relative_to_include()}"
  }
}

terraform {
  extra_arguments "common_vars" {
    commands = get_terraform_commands_that_need_vars()

    arguments = [
      "-var-file=../../terraform.tfvars"
    ]
  }
  before_hook "before_hook_1" {
    commands     = ["apply", "plan"]
    execute      = ["echo", "Will run Terraform"]
  }

  after_hook "after_hook" {
    commands     = ["apply", "plan"]
    execute      = ["echo", "Finished running Terraform"]
    run_on_error = true
  }

}