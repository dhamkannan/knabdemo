terraform {
  backend "remote" {
    organization = "dhamu-test"

    workspaces {
      name = "knab"
    }
  }
}