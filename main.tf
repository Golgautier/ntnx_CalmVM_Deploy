# Download image
resource "nutanix_image" "Images" {
  name        = "Calm-${count.index}"
  description = "Image ${count.index} for Calm VM"
  source_uri  = var.calm_disk_images[count.index]
  
  count = length(var.calm_disk_images)
}

# Identify resources
data "nutanix_subnet" "subnet" {
  subnet_name = var.nutanix_network
}

data "nutanix_cluster" "cluster" {
  name = var.nutanix_cluster
}

# VM Creation
resource "nutanix_virtual_machine" "CalmVM" {
    name = "CalmVM"
    cluster_uuid = data.nutanix_cluster.cluster.id

    num_vcpus_per_socket = 1
    num_sockets          = 8
    memory_size_mib      = 16384

    nic_list {
        subnet_uuid = data.nutanix_subnet.subnet.id
    }

    dynamic "disk_list" {
        for_each = nutanix_image.Images
        iterator = tmp
        content {
            data_source_reference = {
                kind = "image"
                uuid = tmp.value["id"]
            }
            
            device_properties {
                device_type = "DISK"
                disk_address = {
                    adapter_type = "SCSI"
                    device_index = index(nutanix_image.Images.*.id, tmp.value["id"])  
                }
            }
        }
    }
    
    depends_on = [
        nutanix_image.Images
    ]

}

output "machine_ip" {
  value     = nutanix_virtual_machine.CalmVM.nic_list_status.0.ip_endpoint_list.0.ip
  description = "Calm VM IP"
  sensitive = false
}