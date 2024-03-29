resource "null_resource" "run-playbook" {
    provisioner "remote-exec" {
        inline = [
            "echo 'Making sure host is up and reachable'"]

        connection {
            type = "ssh"
            user = "k8s"
            host = var.target_host
            private_key = file("/mnt/c/Users/Ali/PycharmProjects/dissertation/terraform/auth/ssh-key/ssh-key.pem")
        }
    }
    #TODO: Change extra-vars input to a playbook-specific file and make that the new terraform variable input
 #   provisioner "local-exec" {
 #       command = "chmod 600 /mnt/c/Users/Ali/PycharmProjects/dissertation/terraform/auth/ssh-key/ssh-key.pem"
 #   }
    provisioner "local-exec" {
        command = "ansible-playbook -u k8s -i '${var.target_host},' --private-key '/mnt/c/Users/Ali/PycharmProjects/dissertation/terraform/auth/ssh-key/ssh-key.pem' -e cluster_master_ip=${var.cluster_master_ip} -e cluster_worker1_ip=${var.cluster_worker1_ip}  -e cluster_master_internal_ip=${var.cluster_master_internal_ip} -e cluster_worker1_internal_ip=${var.cluster_worker1_internal_ip} -e cluster_master_internal_ip=${var.cluster_master_internal_ip} -e cluster=${var.cluster}  ${var.playbook}"
    }
}