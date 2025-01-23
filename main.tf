module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "test-jenkins-pipeline"
  cidr = "10.100.0.0/16"

  azs             = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
  public_subnets  = ["10.2.1.0/24"]
}