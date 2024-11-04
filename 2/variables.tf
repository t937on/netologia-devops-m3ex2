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

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCgyj1Ri6cpecJrH60gc8e4u99gmN6B+ZgAwtS/1jdfeji0xo32XRSGRci8DwMx18SgFNBVMy7iMPUF+/jZz/R09N+V/cHJXuRjbmbf88sw+r1rJ/LNXwFCMOGmtr7ECBBpm7UrvKDI6ECBakkLzCeWQQRC8Qvvk7EuqkuT/G/dqZqjNyOKFXIy8lRRMgVfnfbMVEKgDA2KuYAK9eZ/UxFsCaFpv06Kzz2pTBQWBJGcCc24H+lZIAi8pFJ1+Z/+IQfrzbq4iuLA9f8XLdADbeOz5FWXc+rDiq0gjqsqVhWBZrB/+q4o1oHWdRNVePCqTmnspxTgS4qtz61593qF4w9h v330@Lenovo-14IKB"
  description = "cat ~/.ssh/id_rsa.pub"
}

###2
variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex compute image family"
}


variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "yandex compute instance name"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "yandex compute instance platform id"
}

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

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "yandex compute instance scheduling policy preemptible"
}

variable "vm_web_nat" {
  type        = bool
  default     = true
  description = "yandex compute instance network interface nat"
}

variable "vm_web_serial_port_enable" {
  type        = number
  default     = 1
  description = "yandex compute instance metadata serial-port-enable"
}
