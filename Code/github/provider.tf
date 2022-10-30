provider "github" {
  token         = "${var.github_token}"
  organization  = "${var.githin_organization}"
}

resource "github_repository" "code" {
  name          = "how_to_TerraformAWS"
  description   = "HowTO about Terraform usage with AWS"
  private       = true
}