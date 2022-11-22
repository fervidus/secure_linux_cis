# @api private
#
# @summary Ensure chrony is configured 
#
class secure_linux_cis::rules::ensure_chrony_is_configured {
  case $facts['osfamily'] {
    'RedHat': {
      $config = '/etc/sysconfig/chronyd'
      $content = 'OPTIONS="-u chrony"'
    }
    'Debian': {
      $config = '/etc/default/chrony'
      $content = 'DAEMON_OPTS="-u _chrony"'
    }
    default: {
      warning ("Chrony check is not supported on os family ${facts['osfamily']}.")
    }
  }
  if $secure_linux_cis::time_sync == 'chrony' {
    class { 'chrony':
      servers  => $secure_linux_cis::time_servers,
    }
    file { $config:
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => $content,
    }
  }
}
