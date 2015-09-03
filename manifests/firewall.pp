class profiles::firewall {
  Firewall {
    before  => Class['::rdm_fw::post'],
    require => Class['::rdm_fw::pre'],
  }
  class { ['::rdm_fw::pre', '::rdm_fw::post']: }
  class { '::firewall': }

  firewall { '22 allow ssh access':
    dport   => [22],
    proto  => tcp,
    action => accept,
  }

}
