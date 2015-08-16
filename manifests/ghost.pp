class profiles::ghost {
  include profiles::nginx

  file { '/etc/pki/tls/certs/_.macduff.ca-bundle.crt':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0444',
    content => hiera('_.macduff.ca::certificate'),
  }
  file { '/etc/pki/tls/private/_.macduff.ca.key':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0444',
    content => hiera('_.macduff.ca::private_key'),
  }
  
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
  create_resources('ghost::blog', hiera_hash('ghost::blogs', {}))
}
