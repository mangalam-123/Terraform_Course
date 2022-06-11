
#Local Variables Block
locals {
  owners = var.Business_unit
  environment = var.Environment
  name = "${var.Business_unit}-${var.Environment}"

  common_tags = {
      owners = local.owners
      environment = local.environment
  }
}