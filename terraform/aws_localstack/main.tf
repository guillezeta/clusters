data "aws_region" "current" {}

resource "aws_s3_bucket" "bucket" {
  bucket = "my-bucket"
}

resource "aws_instance" "web" {
  ami      = "ami-005e54dee72cc1d00"
  instance_type = "t3.micro"

  tags = {
    Name         = "webserver"
    Environment  = "local"
  }
}

resource "aws_route53_zone" "primary" {
  name = "daveops.sh"
}

resource "aws_route53_record" "web" {
  zone_id  = aws_route53_zone.primary.id
  name     = "webserve"
  type     = "A"
  ttl      = 300
  records  = [aws_instance.web.public_ip]
}
