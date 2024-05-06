resource "aws_s3_bucket" "teste_terraform" {
  bucket = "my-tf-test-bucket-lifecycle-gabriel"

  lifecycle {
    create_before_destroy = true   
    ignore_changes        = [tags]  
  }
  tags = {
    test = "vscode"

  }
}