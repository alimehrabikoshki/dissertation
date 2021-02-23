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
        command = "ansible-playbook -u k8s -i '${var.target_host},' --private-key '../auth/ssh-key/ssh-key.pem' -e cluster_master_ip=${var.cluster_master_ip} -e cluster_worker1_ip=${var.cluster_worker1_ip} -e cluster_worker2_ip=${var.cluster_worker2_ip} -e cluster_master_internal_ip=${var.cluster_master_internal_ip} -e cluster_worker1_internal_ip=${var.cluster_worker1_internal_ip} -ecluster_worker2_internal_ip=${var.cluster_worker2_internal_ip} -e cluster_master_internal_ip=${var.cluster_master_internal_ip} -e cluster=${var.cluster} ${var.playbook}"
    }
}