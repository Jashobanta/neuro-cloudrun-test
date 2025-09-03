provider "google" {
    project = "test-project-neuroit"
    region = "us-west1"
}

resource "google_cloudbuild_trigger" "hello_world_trigger"{
    name = "hello_world_trigger"
    location = "us-west1"

    repository_event_config {
        repository ="test-project-neuroit/us-west1/connections/Jashobanta/repositories/Jashobanta-neuro-cloudrun-test"
        push {
            branch = "^main$"
        }
    }
    filename = "cloudrunbuild.yaml"
}