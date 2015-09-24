class profiles::packages {
  class { 'profiles::repos':
    stage => 'pre'
  }
  $packages = hiera('packages')
  ensure_packages( $packages )
}
