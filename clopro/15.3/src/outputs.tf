output "bucket_domain_name" {
  value = yandex_storage_bucket.basket.bucket_domain_name
}

output "backet" {
  value = yandex_storage_bucket.basket.bucket
}

output "object_key" {
  value = yandex_storage_object.object.key
}
