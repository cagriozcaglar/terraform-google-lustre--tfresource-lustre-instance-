output "id" {
  description = "The resource identifier of the Lustre instance."
  value       = google_filestore_instance.lustre_instance.id
}

output "name" {
  description = "The name of the Lustre instance."
  value       = google_filestore_instance.lustre_instance.name
}

output "create_time" {
  description = "The time when the instance was created."
  value       = google_filestore_instance.lustre_instance.create_time
}

output "ip_addresses" {
  description = "The IP addresses of the instance. Clients will use these to connect."
  value       = google_filestore_instance.lustre_instance.networks[0].ip_addresses
}

output "instance" {
  description = "The full Lustre instance resource object."
  value       = google_filestore_instance.lustre_instance
}
