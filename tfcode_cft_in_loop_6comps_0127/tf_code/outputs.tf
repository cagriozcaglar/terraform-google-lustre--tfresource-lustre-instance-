output "access_points" {
  description = "A list of IP addresses of the Lustre instance's access points."
  value       = google_filestore_instance.main.networks[0].ip_addresses
}

output "create_time" {
  description = "The time when the Lustre instance was created."
  value       = google_filestore_instance.main.create_time
}

output "id" {
  description = "The unique identifier for the Lustre instance, in the format `projects/{{project}}/locations/{{location}}/instances/{{name}}`."
  value       = google_filestore_instance.main.id
}

output "instance" {
  description = "The full Lustre instance resource object."
  value       = google_filestore_instance.main
}

output "name" {
  description = "The name of the Lustre instance."
  value       = google_filestore_instance.main.name
}

output "state" {
  description = "The current state of the Lustre instance."
  value       = google_filestore_instance.main.state
}
