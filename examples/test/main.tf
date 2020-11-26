module "asg" {
  source                      = "../../"
  name_prefix                 = "test"
  image_id                    = "ami-00579fbb15b954340"
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  max_size                    = 3
  min_size                    = 1
}
