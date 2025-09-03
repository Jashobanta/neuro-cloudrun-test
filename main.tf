provider "google" {
  project = "test-project-neuroit"
  region  = "us-west1"
}

resource "google_cloudbuild_trigger" "hello-world-trigger" {
  name     = "hello-world-trigger"
  location = "us-west1"

  repository_event_config {
    repository = "projects/test-project-neuroit/locations/us-west1/connections/Jashobanta/repositories/Jashobanta-neuro-cloudrun-test"
    push {
      branch = ".*"
    }
  }
  filename = "cloudbuild.yaml"
  include_build_logs = "INCLUDE_BUILD_LOGS_WITH_STATUS"
}

