# ntnx_CalmVM_Deploy
Deploy dedicated Calm VM on a Nutanix AHV Cluster 

This terraform script will download Calm VM disk images and setup the VM

Variables to provide :
- nutanix_enpoint : IP od the PRISM Central
- nutanix_password : password for the admin user
- nutanix_cluster : Cluster name to deploy the Calm VM
- calm_disk_images : List of qcow2 images (in an array)

Optional : 
- nutanix_user : admin username (Default : admin)
- nutanix_network : network name (Default : Primary)
