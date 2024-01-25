output "bucket_id" {
  value = aws_s3_bucket.bucket.id
}

output "queue_arn" {
  value = aws_sqs_queue.queue.arn
}

output "lambda_function_name" {
  value = aws_lambda_function.lambda.function_name
}

output "sns_topic_arn" {
  value = aws_sns_topic.sns.arn
}

