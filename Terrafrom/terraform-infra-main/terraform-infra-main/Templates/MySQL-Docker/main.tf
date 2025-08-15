# Configure the Docker provider
provider "docker" {
  host = "unix:///var/run/docker.sock"  # For Linux/MacOS; use "npipe:////./pipe/docker_engine" for Windows
}

# Pull the MinIO Docker image
resource "docker_image" "minio_image" {
  name = "minio/minio:latest"
}

# Create a Docker container for MinIO
resource "docker_container" "minio_container" {
  name  = "minio_server"
  image = docker_image.minio_image.name

  ports {
    internal = 9000
    external = 9000  # Access MinIO through port 9000
  }

  env = [
    "MINIO_ROOT_USER=admin",        # Change this to your desired username
    "MINIO_ROOT_PASSWORD=password", # Change this to your desired password
  ]

  # Command to start MinIO in standalone mode
  command = ["server", "/data"]

  volumes {
    container_path = "/data"
    host_path      = "/mnt/data/minio"  # Update this with the appropriate path on your host
  }
}

# Optional: Define an output to display the MinIO endpoint
output "minio_endpoint" {
  value = "http://localhost:9000"
}
