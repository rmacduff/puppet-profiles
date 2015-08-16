class profiles::mail {
  class { 'mandrill': 
   username    => hiera('mandrill::username'),
   apikey      => hiera('mandrill::apikey'),
   mail_domain => hiera('mandrill::mail_domain'),
  }
}
