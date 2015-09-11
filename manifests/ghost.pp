class profiles::ghost {
  include profiles::nginx
  
  package { 'epel-release':
    ensure => installed,
  }
  package { 'nodejs':
    ensure  => installed,
    require => Package['epel-release'],
  }
  package { 'npm':
    ensure  => installed,
    require => Package['nodejs'],
  }

  class { '::ghost':
    require => Package['npm'],
  }
  create_resources('rdm_ghost', hiera_hash('rdm_ghost', {}))
}
