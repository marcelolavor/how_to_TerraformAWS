variable my_tag {
  description = "Additional tags"
  type        = map(string)
  default = {
   Name = ""
   N_Subnets = ""
  }
}

locals {
  time = timestamp()
}

output "timestamp" {
    value = local.time
}

output "my_tag" {
    value = var.my_tag
}