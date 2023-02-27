resource "aws_instance" "vm" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = var.tag_name
    Env  = var.tag_environment
  }


}

resource "null_resource" "pull_state_file" {
  depends_on = [
    aws_instance.vm
  ]

  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = "terraform state pull > task-004.tfstate"
  }
}

resource "null_resource" "push_state_file" {
  depends_on = [
    null_resource.pull_state_file
  ]

  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = "aws s3 mv task-004.tfstate s3://drtierney-terraform-states"
  }
}