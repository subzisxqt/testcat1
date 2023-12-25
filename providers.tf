terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

provider "aws" {
    region = "eu-west-1"
    access_key = "AKIATCWAUXA37EWGL2ER"
    secret_key = "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"
}