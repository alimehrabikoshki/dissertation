/*locals {
    nodes = {"master ip" = var.cluster_master_ip, "worker1 ip" = var.cluster_worker1_ip, "worker2 ip" = var.cluster_worker2_ip}
    workers = {"worker1 ip" = var.cluster_worker1_ip, "worker2 ip" = var.cluster_worker2_ip}

Target cluster1 master and provision server
Target the 3 different cluster masters and provision clients
}*/

resource "null_resource" "save_intrazone_vars"{
  provisioner "local-exec" {
    command = <<EOT
cat <<EOF > /mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/vars_files/test_vars.json
{
  "CNI": "${var.cni}",
  "TESTCASE": "intrazone"
}
EOF
    EOT
  }
}
module "intrazone-test" {
    depends_on = [null_resource.save_intrazone_vars]
    source = "../run-playbook"
    cluster_master_ip = var.cluster_master_ip
    cluster_worker1_ip = var.cluster_worker1_ip
    cluster_worker2_ip = var.cluster_worker2_ip
    k8s_ssh_private_key = var.k8s_ssh_private_key
    playbook = "/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/tests/run_test_script.yaml"
    target_host = var.cluster1_master_public_ip
    cluster_master_internal_ip = var.cluster_master_internal_ip
    cluster_worker1_internal_ip = var.cluster_worker1_internal_ip
    cluster_worker2_internal_ip = var.cluster_worker2_internal_ip
    cluster = var.cluster
}

resource "null_resource" "save_interzone_vars"{
  provisioner "local-exec" {
    command = <<EOT
cat <<EOF > /mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/vars_files/test_vars.json
{
  "CNI": "${var.cni}",
  "TESTCASE": "interzone"
}
EOF
    EOT
  }
}
module "interzone-test" {
    depends_on = [null_resource.save_interzone_vars]
    source = "../run-playbook"
    cluster_master_ip = var.cluster_master_ip
    cluster_worker1_ip = var.cluster_worker1_ip
    cluster_worker2_ip = var.cluster_worker2_ip
    k8s_ssh_private_key = var.k8s_ssh_private_key
    playbook = "/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/tests/run_test_script.yaml"
    target_host = var.cluster2_master_public_ip
    cluster_master_internal_ip = var.cluster_master_internal_ip
    cluster_worker1_internal_ip = var.cluster_worker1_internal_ip
    cluster_worker2_internal_ip = var.cluster_worker2_internal_ip
    cluster = var.cluster
}
resource "null_resource" "save_interregion_vars"{
  provisioner "local-exec" {
    command = <<EOT
cat <<EOF > /mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/vars_files/test_vars.json
{
  "CNI": "${var.cni}",
  "TESTCASE": "interregion"
}
EOF
    EOT
  }
}

module "interregion-test" {
    depends_on = [null_resource.save_interregion_vars]
    source = "../run-playbook"
    cluster_master_ip = var.cluster_master_ip
    cluster_worker1_ip = var.cluster_worker1_ip
    cluster_worker2_ip = var.cluster_worker2_ip
    k8s_ssh_private_key = var.k8s_ssh_private_key
    playbook = "/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/tests/run_test_script.yaml"
    target_host = var.cluster3_master_public_ip
    cluster_master_internal_ip = var.cluster_master_internal_ip
    cluster_worker1_internal_ip = var.cluster_worker1_internal_ip
    cluster_worker2_internal_ip = var.cluster_worker2_internal_ip
    cluster = var.cluster
}
/*

module "cluster2cluster-test" {
    depends_on = [module.pod2pod-test]
    source = "../run-playbook"
#add variable for CNI for additional master/worker playbooks
    cluster_master_ip = var.cluster_master_ip
    cluster_worker1_ip = var.cluster_worker1_ip
    cluster_worker2_ip = var.cluster_worker2_ip
    cluster_master_internal_ip = var.cluster_master_internal_ip
    cluster_worker1_internal_ip = var.cluster_worker1_internal_ip
    cluster_worker2_internal_ip = var.cluster_worker2_internal_ip
    k8s_ssh_private_key = var.k8s_ssh_private_key
    #playbook = "../../../ansible/modules/k8s_nodes/masters/initialise_k8s_master.yaml"
    playbook = "/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/k8s_nodes/masters/initialise_k8s_master.yaml"
    cluster = var.cluster

    target_host = var.cluster_master_ip
}*/