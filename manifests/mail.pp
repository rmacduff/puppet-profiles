class profiles::mail {
  include ::postfix_rdm

  # The mandrill module thinks it's on a debian system
  file { '/etc/ssl/certs/ca-certificates.crt':
    ensure => absent,
  }
}
