terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

resource "random_string" "random" {
  length = 4
  special = false
}

output "instance_prefix" {
  value = random_string.random.id
}