
locals {
    cnis = {"calico"="/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/CNIs/calico/calico_master.yaml",
            "flannel" = "/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/CNIs/flannel/flannel_master.yaml",
            "kuberouter" = "/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/CNIs/kuberouter/kuberouter_master.yaml",
            "cilium"="/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/CNIs/cilium/cilium_master.yaml",
            "canal" = "/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/CNIs/canal/canal_master.yaml",
            "weavenet"="/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/CNIs/weavenet/weavenet_master.yaml",
            "calico_vxlan" = "/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/CNIs/calico/calico_vxlan_master.yaml"}


}

module "provision-testbed" {

  source = "./modules/provision-testbed"
  gcp_auth_file = var.gcp_auth_file
  machine_type = var.machine_type
  gcp_regionA = var.gcp_regionA
  gcp_regionB = var.gcp_regionB
  gcp_regionB_zone = var.gcp_regionB_zone
  regionA_cidr_range = var.regionA_cidr_range
  regionB_cidr_range = var.regionB_cidr_range

}

module "test-calico" {
  depends_on = [module.provision-testbed]
  source = "./modules/configure-cni"

  cni = "calico"
  cni_playbook_path = local.cnis.calico
  cluster1_master_internal_ip = module.provision-testbed.cluster1-master-ip
  cluster1_master_public_ip = module.provision-testbed.cluster1-master-public-ip
  cluster1_worker1_internal_ip = module.provision-testbed.cluster1-worker1-ip
  cluster1_worker1_public_ip = module.provision-testbed.cluster1-worker1-public-ip
  cluster1_worker2_internal_ip = module.provision-testbed.cluster1-worker2-ip
  cluster1_worker2_public_ip =  module.provision-testbed.cluster1-worker2-public-ip
  cluster2_master_internal_ip = module.provision-testbed.cluster2-master-ip
  cluster2_master_public_ip = module.provision-testbed.cluster2-master-public-ip
  cluster2_worker1_internal_ip = module.provision-testbed.cluster2-worker1-ip
  cluster2_worker1_public_ip = module.provision-testbed.cluster2-worker1-public-ip
  cluster2_worker2_internal_ip = module.provision-testbed.cluster2-worker2-ip
  cluster2_worker2_public_ip =  module.provision-testbed.cluster2-worker2-public-ip
  cluster3_master_internal_ip = module.provision-testbed.cluster3-master-ip
  cluster3_master_public_ip = module.provision-testbed.cluster3-master-public-ip
  cluster3_worker1_internal_ip = module.provision-testbed.cluster3-worker1-ip
  cluster3_worker1_public_ip = module.provision-testbed.cluster3-worker1-public-ip
  cluster3_worker2_internal_ip = module.provision-testbed.cluster3-worker2-ip
  cluster3_worker2_public_ip =  module.provision-testbed.cluster3-worker2-public-ip
}

module "test-flannel" {
  depends_on = [module.test-calico]
  source = "./modules/configure-cni"

  cni = "flannel"
  cni_playbook_path = local.cnis.flannel
  cluster1_master_internal_ip = module.provision-testbed.cluster1-master-ip
  cluster1_master_public_ip = module.provision-testbed.cluster1-master-public-ip
  cluster1_worker1_internal_ip = module.provision-testbed.cluster1-worker1-ip
  cluster1_worker1_public_ip = module.provision-testbed.cluster1-worker1-public-ip
  cluster1_worker2_internal_ip = module.provision-testbed.cluster1-worker2-ip
  cluster1_worker2_public_ip =  module.provision-testbed.cluster1-worker2-public-ip
  cluster2_master_internal_ip = module.provision-testbed.cluster2-master-ip
  cluster2_master_public_ip = module.provision-testbed.cluster2-master-public-ip
  cluster2_worker1_internal_ip = module.provision-testbed.cluster2-worker1-ip
  cluster2_worker1_public_ip = module.provision-testbed.cluster2-worker1-public-ip
  cluster2_worker2_internal_ip = module.provision-testbed.cluster2-worker2-ip
  cluster2_worker2_public_ip =  module.provision-testbed.cluster2-worker2-public-ip
  cluster3_master_internal_ip = module.provision-testbed.cluster3-master-ip
  cluster3_master_public_ip = module.provision-testbed.cluster3-master-public-ip
  cluster3_worker1_internal_ip = module.provision-testbed.cluster3-worker1-ip
  cluster3_worker1_public_ip = module.provision-testbed.cluster3-worker1-public-ip
  cluster3_worker2_internal_ip = module.provision-testbed.cluster3-worker2-ip
  cluster3_worker2_public_ip =  module.provision-testbed.cluster3-worker2-public-ip
}

module "test-kuberouter" {
  depends_on = [module.test-flannel]
  source = "./modules/configure-cni"

  cni = "kuberouter"
  cni_playbook_path = local.cnis.kuberouter
  cluster1_master_internal_ip = module.provision-testbed.cluster1-master-ip
  cluster1_master_public_ip = module.provision-testbed.cluster1-master-public-ip
  cluster1_worker1_internal_ip = module.provision-testbed.cluster1-worker1-ip
  cluster1_worker1_public_ip = module.provision-testbed.cluster1-worker1-public-ip
  cluster1_worker2_internal_ip = module.provision-testbed.cluster1-worker2-ip
  cluster1_worker2_public_ip =  module.provision-testbed.cluster1-worker2-public-ip
  cluster2_master_internal_ip = module.provision-testbed.cluster2-master-ip
  cluster2_master_public_ip = module.provision-testbed.cluster2-master-public-ip
  cluster2_worker1_internal_ip = module.provision-testbed.cluster2-worker1-ip
  cluster2_worker1_public_ip = module.provision-testbed.cluster2-worker1-public-ip
  cluster2_worker2_internal_ip = module.provision-testbed.cluster2-worker2-ip
  cluster2_worker2_public_ip =  module.provision-testbed.cluster2-worker2-public-ip
  cluster3_master_internal_ip = module.provision-testbed.cluster3-master-ip
  cluster3_master_public_ip = module.provision-testbed.cluster3-master-public-ip
  cluster3_worker1_internal_ip = module.provision-testbed.cluster3-worker1-ip
  cluster3_worker1_public_ip = module.provision-testbed.cluster3-worker1-public-ip
  cluster3_worker2_internal_ip = module.provision-testbed.cluster3-worker2-ip
  cluster3_worker2_public_ip =  module.provision-testbed.cluster3-worker2-public-ip
}
module "test-cilium" {
  depends_on = [module.test-kuberouter]
  source = "./modules/configure-cni"

  cni = "cilium"
  cni_playbook_path = local.cnis.cilium
  cluster1_master_internal_ip = module.provision-testbed.cluster1-master-ip
  cluster1_master_public_ip = module.provision-testbed.cluster1-master-public-ip
  cluster1_worker1_internal_ip = module.provision-testbed.cluster1-worker1-ip
  cluster1_worker1_public_ip = module.provision-testbed.cluster1-worker1-public-ip
  cluster1_worker2_internal_ip = module.provision-testbed.cluster1-worker2-ip
  cluster1_worker2_public_ip =  module.provision-testbed.cluster1-worker2-public-ip
  cluster2_master_internal_ip = module.provision-testbed.cluster2-master-ip
  cluster2_master_public_ip = module.provision-testbed.cluster2-master-public-ip
  cluster2_worker1_internal_ip = module.provision-testbed.cluster2-worker1-ip
  cluster2_worker1_public_ip = module.provision-testbed.cluster2-worker1-public-ip
  cluster2_worker2_internal_ip = module.provision-testbed.cluster2-worker2-ip
  cluster2_worker2_public_ip =  module.provision-testbed.cluster2-worker2-public-ip
  cluster3_master_internal_ip = module.provision-testbed.cluster3-master-ip
  cluster3_master_public_ip = module.provision-testbed.cluster3-master-public-ip
  cluster3_worker1_internal_ip = module.provision-testbed.cluster3-worker1-ip
  cluster3_worker1_public_ip = module.provision-testbed.cluster3-worker1-public-ip
  cluster3_worker2_internal_ip = module.provision-testbed.cluster3-worker2-ip
  cluster3_worker2_public_ip =  module.provision-testbed.cluster3-worker2-public-ip
}

module "test-canal" {
  depends_on = [module.test-cilium]
  source = "./modules/configure-cni"

  cni = "canal"
  cni_playbook_path = local.cnis.canal
  cluster1_master_internal_ip = module.provision-testbed.cluster1-master-ip
  cluster1_master_public_ip = module.provision-testbed.cluster1-master-public-ip
  cluster1_worker1_internal_ip = module.provision-testbed.cluster1-worker1-ip
  cluster1_worker1_public_ip = module.provision-testbed.cluster1-worker1-public-ip
  cluster1_worker2_internal_ip = module.provision-testbed.cluster1-worker2-ip
  cluster1_worker2_public_ip =  module.provision-testbed.cluster1-worker2-public-ip
  cluster2_master_internal_ip = module.provision-testbed.cluster2-master-ip
  cluster2_master_public_ip = module.provision-testbed.cluster2-master-public-ip
  cluster2_worker1_internal_ip = module.provision-testbed.cluster2-worker1-ip
  cluster2_worker1_public_ip = module.provision-testbed.cluster2-worker1-public-ip
  cluster2_worker2_internal_ip = module.provision-testbed.cluster2-worker2-ip
  cluster2_worker2_public_ip =  module.provision-testbed.cluster2-worker2-public-ip
  cluster3_master_internal_ip = module.provision-testbed.cluster3-master-ip
  cluster3_master_public_ip = module.provision-testbed.cluster3-master-public-ip
  cluster3_worker1_internal_ip = module.provision-testbed.cluster3-worker1-ip
  cluster3_worker1_public_ip = module.provision-testbed.cluster3-worker1-public-ip
  cluster3_worker2_internal_ip = module.provision-testbed.cluster3-worker2-ip
  cluster3_worker2_public_ip =  module.provision-testbed.cluster3-worker2-public-ip
}

module "test-weavenet" {
  depends_on = [module.test-canal]
  source = "./modules/configure-cni"

  cni = "weavenet"
  cni_playbook_path = local.cnis.weavenet
  cluster1_master_internal_ip = module.provision-testbed.cluster1-master-ip
  cluster1_master_public_ip = module.provision-testbed.cluster1-master-public-ip
  cluster1_worker1_internal_ip = module.provision-testbed.cluster1-worker1-ip
  cluster1_worker1_public_ip = module.provision-testbed.cluster1-worker1-public-ip
  cluster1_worker2_internal_ip = module.provision-testbed.cluster1-worker2-ip
  cluster1_worker2_public_ip =  module.provision-testbed.cluster1-worker2-public-ip
  cluster2_master_internal_ip = module.provision-testbed.cluster2-master-ip
  cluster2_master_public_ip = module.provision-testbed.cluster2-master-public-ip
  cluster2_worker1_internal_ip = module.provision-testbed.cluster2-worker1-ip
  cluster2_worker1_public_ip = module.provision-testbed.cluster2-worker1-public-ip
  cluster2_worker2_internal_ip = module.provision-testbed.cluster2-worker2-ip
  cluster2_worker2_public_ip =  module.provision-testbed.cluster2-worker2-public-ip
  cluster3_master_internal_ip = module.provision-testbed.cluster3-master-ip
  cluster3_master_public_ip = module.provision-testbed.cluster3-master-public-ip
  cluster3_worker1_internal_ip = module.provision-testbed.cluster3-worker1-ip
  cluster3_worker1_public_ip = module.provision-testbed.cluster3-worker1-public-ip
  cluster3_worker2_internal_ip = module.provision-testbed.cluster3-worker2-ip
  cluster3_worker2_public_ip =  module.provision-testbed.cluster3-worker2-public-ip
}

module "test-calico_vxlan" {
  depends_on = [module.test-weavenet]
  source = "./modules/configure-cni"

  cni = "calico_vxlan"
  cni_playbook_path = local.cnis.calico_vxlan
  cluster1_master_internal_ip = module.provision-testbed.cluster1-master-ip
  cluster1_master_public_ip = module.provision-testbed.cluster1-master-public-ip
  cluster1_worker1_internal_ip = module.provision-testbed.cluster1-worker1-ip
  cluster1_worker1_public_ip = module.provision-testbed.cluster1-worker1-public-ip
  cluster1_worker2_internal_ip = module.provision-testbed.cluster1-worker2-ip
  cluster1_worker2_public_ip =  module.provision-testbed.cluster1-worker2-public-ip
  cluster2_master_internal_ip = module.provision-testbed.cluster2-master-ip
  cluster2_master_public_ip = module.provision-testbed.cluster2-master-public-ip
  cluster2_worker1_internal_ip = module.provision-testbed.cluster2-worker1-ip
  cluster2_worker1_public_ip = module.provision-testbed.cluster2-worker1-public-ip
  cluster2_worker2_internal_ip = module.provision-testbed.cluster2-worker2-ip
  cluster2_worker2_public_ip =  module.provision-testbed.cluster2-worker2-public-ip
  cluster3_master_internal_ip = module.provision-testbed.cluster3-master-ip
  cluster3_master_public_ip = module.provision-testbed.cluster3-master-public-ip
  cluster3_worker1_internal_ip = module.provision-testbed.cluster3-worker1-ip
  cluster3_worker1_public_ip = module.provision-testbed.cluster3-worker1-public-ip
  cluster3_worker2_internal_ip = module.provision-testbed.cluster3-worker2-ip
  cluster3_worker2_public_ip =  module.provision-testbed.cluster3-worker2-public-ip
}