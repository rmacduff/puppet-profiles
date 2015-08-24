define profiles::user_wrapper (
  $username,
  $ensure = present,
  $uid,
  $ssh_key_type,
  $ssh_key,
  $groups = [],
) {
  user { $username:
    ensure     => $ensure,
    uid        => $uid,
    home       => "/home/${username}",
    managehome => true,
    groups     => $groups,
  }

  group { $username:
    gid               => $uid,
  }

  file { "/home/${username}":
    ensure            =>  directory,
    owner             =>  $username,
    group             =>  $username,
    mode              =>  '0750',
    require           =>  [ User[$username], Group[$username] ],
  }

  file { "/home/${username}/.ssh":
    ensure            =>  directory,
    owner             =>  $username,
    group             =>  $username,
    mode              =>  '0700',
    require           =>  File["/home/${username}"],
  }

  ssh_authorized_key { "${username}-ssh-key":
    user   => $username,
    ensure => present,
    type   => $ssh_key_type,
    key    => $ssh_key
  }

}
