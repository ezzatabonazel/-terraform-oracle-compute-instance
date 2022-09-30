resource "oci_core_instance" "test_instance" {
  count               = var.num_instances
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.compartment_ocid
  display_name        = "TestInstance${count.index}"
  shape               = var.instance_shape

  shape_config {
    ocpus = var.instance_ocpus
    memory_in_gbs = var.instance_shape_config_memory_in_gbs
  }

  create_vnic_details {
    subnet_id                 = oci_core_subnet.test_subnet.id
    assign_public_ip          = true
    assign_private_dns_record = true
  }

  source_details {
    source_type = "image"
    source_id = var.flex_instance_image_ocid[var.region]
  }


  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }
  

  preemptible_instance_config {
    preemption_action {
      type = "TERMINATE"
      preserve_boot_volume = false
    }
  }

}