class profiles::nginx {
  class { '::nginx':
    proxy_set_header => [
      'Host $host',
      'X-Real-IP $remote_addr',
      'X-Forwarded-For $proxy_add_x_forwarded_for',
      'X-Forwarded-Proto $scheme',
    ],
    server_tokens    => 'off',
  }

  file { '/etc/pki/tls/certs/dhparams.pem':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0444',
    content => hiera('dhparams'),
  }

  firewall { '100 allow http and https access':
    dport   => [80, 443],
    proto  => tcp,
    action => accept,
  }
}
