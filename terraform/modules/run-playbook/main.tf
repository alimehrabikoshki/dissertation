resource "null_resource" "run-playbook" {
    provisioner "remote-exec" {
        inline = [
            "sudo apt update",
            "sudo apt install python3 -y"]

        connection {
            type = "ssh"
            user = "k8s"
            host = var.target_host
            private_key = var.k8s_ssh_private_key
        }
    }

    provisioner "local-exec" {
        command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u k8s -i '${var.target_host},' --private-key ${var.k8s_ssh_private_key} -e 'cluster_master_ip=${var.cluster_master_ip},cluster_worker1_ip=${var.cluster_worker1_ip},cluster_worker2_ip=${var.cluster_worker2_ip}' ${var.playbook}"
    }
}