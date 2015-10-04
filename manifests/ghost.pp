class profiles::ghost {
  include profiles::nginx
  
  package { 'nodejs':
    ensure  => installed,
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
