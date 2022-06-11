
locals {
  owners = var.business_division
  enviornment = var.environment
  name = "${var.business_division}-${var.environment}"
  #name = "${local.owners}-${local.environment}"

  comman_tags = {

      owners = local.owners
      enviornment = local.enviornment
  }
}