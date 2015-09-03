class profiles::services {
  $services = hiera_hash('services', {})
  create_resources('service', $services)
}
