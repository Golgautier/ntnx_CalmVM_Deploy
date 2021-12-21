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
    description = "List of Calm disk images"
    default = [
       "https://glnuta.blob.core.windows.net/share/calm-vm-boot-pc.2021.7-calm-3.3.0.qcow2",    
       "https://glnuta.blob.core.windows.net/share/calm-vm-data-pc.2021.7-calm-3.3.0.qcow2",
       "https://glnuta.blob.core.windows.net/share/calm-vm-es-data-pc.2021.7-calm-3.3.0.qcow2",
       "https://glnuta.blob.core.windows.net/share/calm-vm-home-pc.2021.7-calm-3.3.0.qcow2"
    ]
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
