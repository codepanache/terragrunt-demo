include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"
  mock_outputs = {
      vpc-id = "temp-vpc-id"
      subnet-id = tomap({"us-west1"="temp-subnet-id","us-west2"="temp-subnet-id"})
  }
}

inputs = {
  vpc-id = dependency.vpc.outputs.vpc-id
  subnet-id = dependency.vpc.outputs.subnet-id
}