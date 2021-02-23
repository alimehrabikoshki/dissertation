locals {
    nodes = {"master ip" = var.cluster_master_ip, "worker1 ip" = var.cluster_worker1_ip, "worker2 ip" = var.cluster_worker2_ip}
    workers = {"worker1 ip" = var.cluster_worker1_ip, "worker2 ip" = var.cluster_worker2_ip}

}

module "initialise-nodes" {
    source = "../run-playbook"
    for_each = local.nodes
    cluster_master_ip = var.cluster_master_ip
    cluster_worker1_ip = var.cluster_worker1_ip
    cluster_worker2_ip = var.cluster_worker2_ip
    k8s_ssh_private_key = var.k8s_ssh_private_key
  #  playbook = "../../../ansible/modules/k8s_nodes/all/initialise_k8s_node.yaml"
    playbook = "/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/k8s_nodes/all/initialise_k8s_node.yaml"
    target_host = each.value
    cluster_master_internal_ip = var.cluster_master_internal_ip
    cluster_worker1_internal_ip = var.cluster_worker1_internal_ip
    cluster_worker2_internal_ip = var.cluster_worker2_internal_ip
    cluster = var.cluster
}

module "configure-master" {
    depends_on = [module.initialise-nodes]
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
}

#add variable for CNI for additional master/worker playbooks
module "configure-cni" {
    depends_on = [module.configure-master]
    source = "../run-playbook"
    cluster_master_ip = var.cluster_master_ip
    cluster_worker1_ip = var.cluster_worker1_ip
    cluster_worker2_ip = var.cluster_worker2_ip
    cluster_master_internal_ip = var.cluster_master_internal_ip
    cluster_worker1_internal_ip = var.cluster_worker1_internal_ip
    cluster_worker2_internal_ip = var.cluster_worker2_internal_ip
    k8s_ssh_private_key = var.k8s_ssh_private_key
    playbook = var.cni_playbook_path
    target_host = var.cluster_master_ip
    cluster = var.cluster

}
module "configure-workers" {
    depends_on = [module.configure-cni]
    source = "../run-playbook"
    for_each = local.workers
    cluster_master_ip = var.cluster_master_ip
    cluster_worker1_ip = var.cluster_worker1_ip
    cluster_worker2_ip = var.cluster_worker2_ip
    cluster_master_internal_ip = var.cluster_master_internal_ip
    cluster_worker1_internal_ip = var.cluster_worker1_internal_ip
    cluster_worker2_internal_ip = var.cluster_worker2_internal_ip
    k8s_ssh_private_key = var.k8s_ssh_private_key
  #  playbook = "../../../ansible/modules/k8s_nodes/workers/initialise_k8s_worker.yaml"
    playbook = "/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/k8s_nodes/workers/initialise_k8s_worker.yaml"
    target_host = each.value
    cluster = var.cluster

}
/*

module "configure-worker2" {
    source = "../run-playbook"
#add variable for CNI for additional master/worker playbooks
    cluster_master_ip = var.cluster_master_ip
    cluster_worker1_ip = var.cluster_worker1_ip
    cluster_worker2_ip = var.cluster_worker2_ip
    k8s_ssh_private_key = var.k8s_ssh_private_key
    playbook = "../initialise_k8s_worker.yaml"
    target_host = var.cluster_worker2_ip
}*/
