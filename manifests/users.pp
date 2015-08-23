class profiles::users {
  $users = hiera_hash('users', {})
  create_resources('::profiles::user_wrapper', $users)
}
