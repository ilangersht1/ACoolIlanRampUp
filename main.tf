provider "aws" {
  region = "eu-central-1"

  # Excellent! we also use default_tags to add owner and project to all resources
  default_tags {
    tags = {
      env = "rampup" # you can add terraform fmt -recursive to your IDE when saving
    }
  }
}