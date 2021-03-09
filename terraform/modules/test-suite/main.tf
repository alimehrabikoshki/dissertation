/*locals {
    nodes = {"master ip" = var.cluster_master_ip, "worker1 ip" = var.cluster_worker1_ip, "worker2 ip" = var.cluster_worker2_ip}
    workers = {"worker1 ip" = var.cluster_worker1_ip, "worker2 ip" = var.cluster_worker2_ip}

Target cluster1 master and provision server
Target the 3 different cluster masters and provision clients
}*/

module "pod2pod-test" {
    source = "../run-playbook"
    cluster_master_ip = var.cluster_master_ip
    cluster_worker1_ip = var.cluster_worker1_ip
    cluster_worker2_ip = var.cluster_worker2_ip
    k8s_ssh_private_key = var.k8s_ssh_private_key
    playbook = "/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/tests/pod2pod-test.yaml"
    target_host = var.cluster_master_ip
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