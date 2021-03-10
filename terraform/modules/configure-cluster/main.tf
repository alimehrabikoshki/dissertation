locals {
    nodes = {"master ip" = var.cluster_master_ip, "worker1 ip" = var.cluster_worker1_ip, "worker2 ip" = var.cluster_worker2_ip}
    workers = {"worker1 ip" = var.cluster_worker1_ip, "worker2 ip" = var.cluster_worker2_ip}

}

module "initialise-nodes" {
    source = "../run-playbook"
    for_each = local.nodes
    target_host = each.value

    cluster_master_ip = var.cluster_master_ip
    cluster_worker1_ip = var.cluster_worker1_ip
    cluster_worker2_ip = var.cluster_worker2_ip
    playbook = var.initialise_nodes_playbook_path
    cluster_master_internal_ip = var.cluster_master_internal_ip
    cluster_worker1_internal_ip = var.cluster_worker1_internal_ip
    cluster_worker2_internal_ip = var.cluster_worker2_internal_ip
    cluster = var.cluster
}

module "configure-master" {
    depends_on = [module.initialise-nodes]
    source = "../run-playbook"
    cluster_master_ip = var.cluster_master_ip
    cluster_worker1_ip = var.cluster_worker1_ip
    cluster_worker2_ip = var.cluster_worker2_ip
    cluster_master_internal_ip = var.cluster_master_internal_ip
    cluster_worker1_internal_ip = var.cluster_worker1_internal_ip
    cluster_worker2_internal_ip = var.cluster_worker2_internal_ip
    playbook = var.initialise_master_playbook_path
    cluster = var.cluster
    target_host = var.cluster_master_ip
}

module "configure-cni" {
    depends_on = [module.configure-master]
    source = "../run-playbook"
    cluster_master_ip = var.cluster_master_ip
    cluster_worker1_ip = var.cluster_worker1_ip
    cluster_worker2_ip = var.cluster_worker2_ip
    cluster_master_internal_ip = var.cluster_master_internal_ip
    cluster_worker1_internal_ip = var.cluster_worker1_internal_ip
    cluster_worker2_internal_ip = var.cluster_worker2_internal_ip
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
    playbook = var.initialise_worker_playbook_path
    target_host = each.value
    cluster = var.cluster

}