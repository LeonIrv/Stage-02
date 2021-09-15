terraform {
  backend "gcs" {
    bucket = "tf-demo-task02"
    prefix = "terraform/state"
  }
}