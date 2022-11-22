# @api private
#
# @summary Ensure permissions on /etc/shadow are configured 
#
class secure_linux_cis::rules::ensure_permissions_on_etc_shadow_are_configured {
  case $facts['os']['family'] {
    'RedHat': {
      file { '/etc/shadow':
        ensure => file,
        owner  => 'root',
        group  => 'root',
        mode   => '0000',
      }
    }
    'Debian': {
      file { '/etc/shadow':
        ensure => file,
        owner  => 'root',
        group  => 'shadow',
        mode   => '0640',
      }
    }
    default: {
      warning ("shadow configuration not supported on os family ${facts['os']['family']}.")
    }
  }
}
