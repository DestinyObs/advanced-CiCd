resource "null_resource" "ansible_inventory" {
  provisioner "local-exec" {
    command = "sudo ${path.module}/generate_inventory.sh"
  }

  depends_on = [
    aws_instance.jenkins_master,
    aws_instance.jenkins_agent
  ]
}

resource "null_resource" "ansible_provision" {
  provisioner "local-exec" {
    command = "ansible-playbook -i inventory playbook.yml -vv"
  }

  depends_on = [null_resource.ansible_inventory]
}
