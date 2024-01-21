variable "region" {
  description = "The region where AWS resources will be created"
  type    = string
  default = "us-west-2"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type    = string
  default = "my-bucket-name"
}

variable "queue_name" {
  description = "The name of the SQS queue"
  type    = string
  default = "my-queue-name"
}

variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type    = string
  default = "my-lambda_function_name"
}

variable "sns_topic_name" {
  description = "The name of the SNS topic"
  type    = string
  default = "my-sns-topic-name"
}

