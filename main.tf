terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">= 4.52.0"
    }
  }
}
provider "google" {
  project = "test-project-neuroit"
  region  = "us-west1"
}


resource "google_cloudbuild_trigger" "hello-world-trigger" {
  name     = "hello-world-trigger"
  location = "us-west1"
  #service_account = "798073461085-compute@developer.gserviceaccount.com"
  service_account = "cloudrun@test-project-neuroit.iam.gserviceaccount.com"

  repository_event_config {
    repository = "projects/test-project-neuroit/locations/us-west1/connections/Jashobanta/repositories/Jashobanta-neuro-cloudrun-test"
    push {
      branch = ".*"
    }
  }
  filename = "cloudbuild.yaml"
  include_build_logs = "INCLUDE_BUILD_LOGS_WITH_STATUS"
}

