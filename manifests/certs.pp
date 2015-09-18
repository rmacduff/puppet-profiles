define profiles::certs (
) {
  file { "/etc/pki/tls/certs/${name}-bundle.crt":
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0444',
    content => hiera("${name}::certificate"),
  }
  file { "/etc/pki/tls/private/${name}.key":
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0444',
    content => hiera("${name}::private_key"),
  }
}
