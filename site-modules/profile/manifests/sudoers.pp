# Manage user privileges
class profile::sudoers {
  sudo::conf { 'secure_path':
    content  => 'Defaults      secure_path="/opt/puppetlabs/puppet/bin:/opt/puppetlabs/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"',
    priority => 0,
  }
  $sudoers = lookup('sudoers', Array[String], 'unique', [])
  $sudoers.each | String $user | {
    sudo::conf { $user:
      content  => "${user} ALL=(ALL) NOPASSWD: ALL",
      priority => 10,
    }
  }
}
