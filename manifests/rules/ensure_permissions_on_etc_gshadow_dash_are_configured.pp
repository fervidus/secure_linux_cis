# @api private
#
# @summary Ensure permissions on /etc/gshadow- are configured 
#
class secure_linux_cis::rules::ensure_permissions_on_etc_gshadow_dash_are_configured {
  case $facts['osfamily'] {
    'RedHat': {
      file { '/etc/gshadow-':
        ensure => file,
        owner  => 'root',
        group  => 'root',
        mode   => '0000',
      }
    }
    'Debian': {
      file { '/etc/gshadow-':
        ensure => file,
        owner  => 'root',
        group  => 'shadow',
        mode   => '0640',
      }
    }
    default: {
      warning ("gshadow- configuration not supported on os family ${facts['osfamily']}.")
    }
  }
}
