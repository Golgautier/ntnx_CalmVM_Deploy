variable "nutanix_endpoint" {
    type = string
    description = "Prism Central IP or FQDN"
}

variable "nutanix_username" {
    default = "admin"
    type = string
    description = "Admin user name for PC"
}

variable "nutanix_password" {
    type = string
    description = "Password for this admin user"
    sensitive = true
}


variable "nutanix_port" {
    default = "9440"
    type = number
    description = "Port de communication pour le PC"
  
}

variable "calm_disk_images" {
    type = list(string)
    description = "List of Calm disk images URLs"
}

variable "nutanix_network" {
    description = "Nutanix network to use"
    type = string
    default = "Primary"
}

variable "nutanix_cluster" {
    description = "Nutanix cluster where Calm VM will be hosted"
    type = string
}
