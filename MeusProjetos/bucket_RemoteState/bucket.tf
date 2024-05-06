resource "aws_s3_bucket" "teste_Remote" {
  bucket = "gabrieltesteremotestate"

}

resource "aws_s3_bucket_versioning" "versionamento_s3" {
  bucket = aws_s3_bucket.teste_Remote.id
  versioning_configuration {

    status = "Enabled"
  }
}

