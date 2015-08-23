define profiles::user_wrapper (
  $username,
  $ensure = present,
  $uid,
  $ssh_key_type,
  $ssh_key,
) {
  user { $username:
    ensure     => $ensure,
    uid        => $uid,
    home       => "home/${username}",
    managehome => true,
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

}
