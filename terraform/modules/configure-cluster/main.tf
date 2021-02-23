locals {
    nodes = [var.cluster_master_ip, var.cluster_worker1_ip, var.cluster_worker2_ip]
    workers = [var.cluster_worker1_ip, var.cluster_worker2_ip]

}

module "initialise-nodes" {
    source = "../run-playbook"
    for_each = local.nodes
    cluster_master_ip = var.cluster_master_ip
    cluster_worker1_ip = var.cluster_worker1_ip
    cluster_worker2_ip = var.cluster_worker2_ip
    k8s_ssh_private_key = var.k8s_ssh_private_key
    playbook = "../../../ansible/modules/k8s_nodes/all/initialise_k8s_node.yaml"
    target_host = each.key
}

module "configure-master" {
    source = "../run-playbook"
#add variable for CNI for additional master/worker playbooks
    cluster_master_ip = var.cluster_master_ip
    cluster_worker1_ip = var.cluster_worker1_ip
    cluster_worker2_ip = var.cluster_worker2_ip
    k8s_ssh_private_key = var.k8s_ssh_private_key
    playbook = "../../../ansible/modules/k8s_nodes/masters/initialise_k8s_master.yaml"
    target_host = var.cluster_master_ip
}

#add variable for CNI for additional master/worker playbooks
module "configure-cni" {
    source = "../run-playbook"
    cluster_master_ip = var.cluster_master_ip
    cluster_worker1_ip = var.cluster_worker1_ip
    cluster_worker2_ip = var.cluster_worker2_ip
    k8s_ssh_private_key = var.k8s_ssh_private_key
    playbook = var.cni_playbook_path
    target_host = var.cluster_master_ip
}
module "configure-workers" {
    source = "../run-playbook"
    for_each = local.workers
    cluster_master_ip = var.cluster_master_ip
    cluster_worker1_ip = var.cluster_worker1_ip
    cluster_worker2_ip = var.cluster_worker2_ip
    k8s_ssh_private_key = var.k8s_ssh_private_key
    playbook = "../../../ansible/modules/k8s_nodes/workers/initialise_k8s_worker.yaml"
    target_host = each.key
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
