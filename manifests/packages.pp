class profiles::packages {
  $packages = hiera('packages')
  package { $packages: 
    ensure => installed,
  }
}
