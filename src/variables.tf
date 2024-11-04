###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars
/*
variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCgyj1Ri6cpecJrH60gc8e4u99gmN6B+ZgAwtS/1jdfeji0xo32XRSGRci8DwMx18SgFNBVMy7iMPUF+/jZz/R09N+V/cHJXuRjbmbf88sw+r1rJ/LNXwFCMOGmtr7ECBBpm7UrvKDI6ECBakkLzCeWQQRC8Qvvk7EuqkuT/G/dqZqjNyOKFXIy8lRRMgVfnfbMVEKgDA2KuYAK9eZ/UxFsCaFpv06Kzz2pTBQWBJGcCc24H+lZIAi8pFJ1+Z/+IQfrzbq4iuLA9f8XLdADbeOz5FWXc+rDiq0gjqsqVhWBZrB/+q4o1oHWdRNVePCqTmnspxTgS4qtz61593qF4w9h v330@Lenovo-14IKB"
  description = "cat ~/.ssh/id_rsa.pub"
}
*/

###2
variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex compute image family"
}

/*
variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "yandex compute instance name"
}
*/

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "yandex compute instance platform id"
}

/*
variable "vm_web_cores" {
  type        = number
  default     = 2
  description = "yandex compute instance resources cores"
}

variable "vm_web_memory" {
  type        = number
  default     = 1
  description = "yandex compute instance resources memory"
}

variable "vm_web_core_fraction" {
  type        = number
  default     = 20
  description = "yandex compute instance resources core-fraction"
}
*/

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "yandex compute instance scheduling policy preemptible"
}

variable "vm_web_nat" {
  type        = bool
#  default     = true
  default     = false
  description = "yandex compute instance network interface nat"
}

/*
variable "vm_web_serial_port_enable" {
  type        = number
  default     = 1
  description = "yandex compute instance metadata serial-port-enable"
}
*/

###4
variable "vm_external_ips" {
  type        = list(string)
  default     = ["158.160.83.76", "158.160.83.77"]
  description = "yandex compute instance vm ip-addresses"
}

variable "vm_fqdns" {
  type        = list(string)
  default     = ["netology.develop.platform.web", "netology.develop.platform.db"]
  description = "yandex compute instance vm fully qualified domain names"
}

###5
variable "vm_web_env" {
  type        = string
  default     = "develop"
  description = "yandex compute instance name env"
}
variable "vm_web_project" {
  type        = string
  default     = "platform"
  description = "yandex compute instance name project"
}
variable "vm_web_role" {
  type        = string
  default     = "web"
  description = "yandex compute instance name role"
}

###6
variable "vms_resources" {
  description = "единая map-переменная"
  type = map(object({
      cores         = number
      memory        = number
      core_fraction = number
  }))
  
  default = {
    web = {
        cores        = 2
        memory       = 1
        core_fraction = 20
    },
    db = {
        cores        = 2
        memory       = 2
        core_fraction = 20
    }
  }
}

variable "metadata" {
  description = "общая для всех ВМ"
  type = map(object({
      serial-port-enable = number
      ssh-keys           = string
  }))
  
  default = {
    web = {
        serial-port-enable = 1
        ssh-keys = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCgyj1Ri6cpecJrH60gc8e4u99gmN6B+ZgAwtS/1jdfeji0xo32XRSGRci8DwMx18SgFNBVMy7iMPUF+/jZz/R09N+V/cHJXuRjbmbf88sw+r1rJ/LNXwFCMOGmtr7ECBBpm7UrvKDI6ECBakkLzCeWQQRC8Qvvk7EuqkuT/G/dqZqjNyOKFXIy8lRRMgVfnfbMVEKgDA2KuYAK9eZ/UxFsCaFpv06Kzz2pTBQWBJGcCc24H+lZIAi8pFJ1+Z/+IQfrzbq4iuLA9f8XLdADbeOz5FWXc+rDiq0gjqsqVhWBZrB/+q4o1oHWdRNVePCqTmnspxTgS4qtz61593qF4w9h v330@Lenovo-14IKB"
    },
    db = {
        serial-port-enable = 1
        ssh-keys = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCgyj1Ri6cpecJrH60gc8e4u99gmN6B+ZgAwtS/1jdfeji0xo32XRSGRci8DwMx18SgFNBVMy7iMPUF+/jZz/R09N+V/cHJXuRjbmbf88sw+r1rJ/LNXwFCMOGmtr7ECBBpm7UrvKDI6ECBakkLzCeWQQRC8Qvvk7EuqkuT/G/dqZqjNyOKFXIy8lRRMgVfnfbMVEKgDA2KuYAK9eZ/UxFsCaFpv06Kzz2pTBQWBJGcCc24H+lZIAi8pFJ1+Z/+IQfrzbq4iuLA9f8XLdADbeOz5FWXc+rDiq0gjqsqVhWBZrB/+q4o1oHWdRNVePCqTmnspxTgS4qtz61593qF4w9h v330@Lenovo-14IKB"
    }
  }
}


###8*
variable "test" {
  description = "переменная test Задание 8"
  type        = list(map(list(string)))
  default     = [
  {
    "dev1" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117",
      "10.0.1.7",
    ]
  },
  {
    "dev2" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@84.252.140.88",
      "10.0.2.29",
    ]
  },
  {
    "prod1" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@51.250.2.101",
      "10.0.1.30",
    ]
  },
]

}

###9*
variable "vpc_net_name" {
  type        = string
  default     = "develop_net"
  description = "VPC network & subnet name"
}

variable "subnet_cidr" {
  type        = list(string)
  default     = ["10.20.30.0/24"]
  description = "https://yandex.cloud/ru/docs/vpc/operations/create-nat-gateway#tf_1"
}

variable "nat_gateway_name" {
  type        = string
  default     = "test-gateway"
  description = "yandex_vpc_gateway nat_gateway name"
}

variable "rt_name" {
  type        = string
  default     = "test-route-table"
  description = "yandex_vpc_route_table rt name"
}


variable "rt_static_route_destination_prefix" {
  type        = string
  default     = "0.0.0.0/0"
  description = "yandex_vpc_route_table rt static route destination prefix"
}


variable "vm_stop_for_update" {
  type        = bool
  default     = true
  description = "yandex_compute_instance allow_stopping_for_update"
}

