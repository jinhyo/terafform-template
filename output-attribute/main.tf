
resource "local_file" "random_code" {
  filename        = "/Users/ray/Desktop/code/terafform-template/output-attribute/file/random1.txt"
  content         = "${random_string.random_code.id}"
  file_permission = "0700"

  depends_on = [
    random_string.random_code
  ]

  # lifecycle {
  #   create_before_destroy = true
  # }
}

resource "local_file" "random_code2" {
  filename        = "/Users/ray/Desktop/code/terafform-template/output-attribute/file/random2.txt"
  content         = random_string.random_code.id
  file_permission = "0700"

  #   depends_on = [
  #   random_string.random_code
  # ]

  # lifecycle {
  #   create_before_destroy = true
  # }
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
