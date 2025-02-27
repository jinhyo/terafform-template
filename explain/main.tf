# local_file: provider, resource type
# hello: resource name

terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.4.0" 
      # > 1.0.0  : 1.0.0 이상 사용 가능
      # < 2.4.0  : 2.4.0 미만 사용 가능
      # > 1.0.0, < 2.4.0 : 1.0.0 이상 2.4.0 미만 사용 가능
      # != 1.2.0 : 1.2.0 제외하고 사용 가능
      # ~> 1.1 : 1.1 ~ 1.9 사용 가능
      # ~> 1.1.0 : 1.1.0 ~ 1.1.9 사용 가능
    }
  }
}

resource "local_file" "hello" {
  filename = var.filename
  content         = random_string.random_code.id
  file_permission = "0700"
  depends_on = [
    random_string.random_code
  ]

  lifecycle {
    create_before_destroy = true // create new resource before destroy old resource
  }
}

data "local_file" "world" {
  filename = "./world.txt"
}

resource "local_file" "test_count" {
  filename = var.filename_list[count.index]
  content  = "test"
  count    = length(var.filename_list)
}

resource "local_file" "test_foreach" {
  filename = each.value
  content  = "test"
  for_each = var.filename_set
}

resource "random_string" "random_code" {
  length  = 5
  special = false
  upper   = false
}

output "random_code_output" {
  value       = random_string.random_code.id
  description = "This value will be the id of random_string.random_code"
}

# with cli argument
# terraform plan -var="filename='/tmp/world.txt'" -var="content='hi hi hi'"

# with environment variable
# export TF_VAR_filename=/tmp/world1.txt && terraform plan
