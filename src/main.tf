resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}
resource "yandex_compute_instance" "platform" {
  name        = local.vm_web_name
  zone        = var.default_zone
  platform_id = var.vm_web_platform_id
  
  allow_stopping_for_update = var.vm_stop_for_update
  
  resources {
    cores         = var.vms_resources["web"].cores
    memory        = var.vms_resources["web"].memory
    core_fraction = var.vms_resources["web"].core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_preemptible
  } 
  network_interface {
#    subnet_id = yandex_vpc_subnet.develop.id
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = var.vm_web_nat
  }

  metadata = {
    serial-port-enable = var.metadata["web"]["serial-port-enable"]
    ssh-keys           = var.metadata["web"]["ssh-keys"]
  }
  
}


resource "yandex_compute_instance" "platform_db" {
  name        = local.vm_db_name
  zone        = var.vm_db_zone
  platform_id = var.vm_db_platform_id
  resources {
    cores         = var.vms_resources["db"].cores
    memory        = var.vms_resources["db"].memory
    core_fraction = var.vms_resources["db"].core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_preemptible
  } 
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_db_nat
  }

  metadata = {
    serial-port-enable = var.metadata["db"]["serial-port-enable"]
    ssh-keys           = var.metadata["db"]["ssh-keys"]
  }
  
}



###9*
data "yandex_vpc_network" "net" {
  folder_id = var.folder_id
  name      = var.vpc_name
}

resource "yandex_vpc_subnet" "subnet" {
  folder_id      = var.folder_id
  name           = var.vpc_net_name
  v4_cidr_blocks = var.subnet_cidr
  zone           = var.default_zone
  network_id     = data.yandex_vpc_network.net.id
  route_table_id = yandex_vpc_route_table.rt.id
}

resource "yandex_vpc_gateway" "nat_gateway" {
  folder_id      = var.folder_id
  name = var.nat_gateway_name
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "rt" {
  folder_id  = var.folder_id
  name       = var.rt_name
  network_id = data.yandex_vpc_network.net.id

  static_route {
    destination_prefix = var.rt_static_route_destination_prefix
    gateway_id         = yandex_vpc_gateway.nat_gateway.id
  }
}


