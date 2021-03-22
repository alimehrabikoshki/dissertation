module "deploy-nettest-server" {
    source = "../run-playbook"
    cluster_master_ip = var.cluster_master_ip
    cluster_worker1_ip = var.cluster_worker1_ip
    playbook = "/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/k8s_nodes/masters/deploy_nettest_server.yaml"
    target_host = var.cluster1_master_public_ip
    cluster_master_internal_ip = var.cluster_master_internal_ip
    cluster_worker1_internal_ip = var.cluster_worker1_internal_ip
    cluster = var.cluster
}

resource "null_resource" "save_intrazone_vars"{
  depends_on = [module.deploy-nettest-server]
  provisioner "local-exec" {
    command = <<EOT
echo "
{
  "CNI": "${var.cni}",
  "TESTCASE": "intrazone"
} " > /mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/vars_files/test_vars.json
    EOT
  }
}
module "intrazone-test" {
    depends_on = [null_resource.save_intrazone_vars]
    source = "../run-playbook"
    cluster_master_ip = var.cluster_master_ip
    cluster_worker1_ip = var.cluster_worker1_ip
    playbook = "/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/tests/run_test_script.yaml"
    target_host = var.cluster1_master_public_ip
    cluster_master_internal_ip = var.cluster_master_internal_ip
    cluster_worker1_internal_ip = var.cluster_worker1_internal_ip
    cluster = var.cluster
}

resource "null_resource" "save_interzone_vars"{
  depends_on = [module.intrazone-test]
  provisioner "local-exec" {
    command = <<EOT
echo "
{
  "CNI": "${var.cni}",
  "TESTCASE": "interzone"
} " > /mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/vars_files/test_vars.json
    EOT
  }
}
module "interzone-test" {
    depends_on = [null_resource.save_interzone_vars, module.intrazone-test]
    source = "../run-playbook"
    cluster_master_ip = var.cluster_master_ip
    cluster_worker1_ip = var.cluster_worker1_ip
    playbook = "/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/tests/run_test_script.yaml"
    target_host = var.cluster2_master_public_ip
    cluster_master_internal_ip = var.cluster_master_internal_ip
    cluster_worker1_internal_ip = var.cluster_worker1_internal_ip
    cluster = var.cluster
}
resource "null_resource" "save_interregion_vars"{
  depends_on = [module.interzone-test]
  provisioner "local-exec" {
    command = <<EOT
echo "
{
  "CNI": "${var.cni}",
  "TESTCASE": "interregion"
} " > /mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/vars_files/test_vars.json
    EOT
  }
}

module "interregion-test" {
    depends_on = [null_resource.save_interregion_vars, module.interzone-test]
    source = "../run-playbook"
    cluster_master_ip = var.cluster_master_ip
    cluster_worker1_ip = var.cluster_worker1_ip
    playbook = "/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/tests/run_test_script.yaml"
    target_host = var.cluster3_master_public_ip
    cluster_master_internal_ip = var.cluster_master_internal_ip
    cluster_worker1_internal_ip = var.cluster_worker1_internal_ip
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