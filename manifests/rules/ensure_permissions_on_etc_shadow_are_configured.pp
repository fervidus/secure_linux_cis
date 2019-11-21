#  Ensure permissions on /etc/shadow are configured (Scored)
#
# Description:
# The /etc/shadow file is used to store the information about user accounts that is critical to the
# security of those accounts, such as the hashed password and other security information.
#
# @summary  Ensure permissions on /etc/shadow are configured (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_permissions_on_etc_shadow_are_configured

class secure_linux_cis::rules::ensure_permissions_on_etc_shadow_are_configured {

  case $facts['os']['family'] {
    'RedHat': {
      file {'/etc/shadow':
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0000',
      }
    }
    'Debian': {
      file {'/etc/shadow':
        ensure => present,
        owner  => 'root',
        group  => 'shadow',
        mode   => '0640',
      }
    }
    default: {
    }
  }
}
