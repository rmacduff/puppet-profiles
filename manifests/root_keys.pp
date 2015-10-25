class profiles::root_keys {
  $keys = hiera_hash('root_keys', {})
  $root_defaults = { user => 'root', }
  create_resources('ssh_authorized_key', $keys, $root_defaults)
}
