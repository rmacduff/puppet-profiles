class profiles::mail {
  class { 'mandrill': 
   username       => hiera('mandrill::username'),
   apikey         => hiera('mandrill::apikey'),
   mail_domain    => hiera('mandrill::mail_domain'),
   relayhost_port => hiera('mandrill::relayhost_port'),
  }

  # The mandrill module thinks it's on a debian system
  file { '/etc/ssl/certs/ca-certificates.crt':
    ensure => link,
    target => '/etc/pki/tls/certs/ca-bundle.crt',
  }
}
