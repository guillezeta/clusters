terraform{

  required_version = "= 1.5.4"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 3.60.0, < 4.22.0"
    }
  }
}

provider "aws" {
  access_key                  = "fake"
  secret_key                  = "fake"
  region                      = "us-east-1"
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ec2            = "http://192.168.211.150:4566"
    route53        = "http://192.168.211.150:4566"
    route53resolver= "http://192.168.211.150:4566"
    s3             = "http://192.168.211.150:4566"
    s3control      = "http://192.168.211.150:4566"

  }

default_tags {
  tags = {
    Environment = "Local"
    Service     = "LocalStack"
  }
}
}