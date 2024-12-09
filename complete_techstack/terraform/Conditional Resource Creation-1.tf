#Question Recap
#Write a Terraform configuration to create a Google Compute Engine instance only if a specific variable, create_instance, is set to true. Otherwise, no instance should be created.
variable "create_instance" {
  description = "Boolean to decide whether to create an instance"
  type        = bool
  default     = false
}

resource "google_compute_instance" "example" {
  count        = var.create_instance ? 1 : 0
  name         = "example-instance"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
#Explanation
#The count parameter is set to 1 if create_instance is true, otherwise 0.
#This approach ensures the resource is conditionally created.
