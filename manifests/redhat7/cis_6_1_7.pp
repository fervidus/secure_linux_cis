# 6.1.7 Ensure permissions on /etc/shadow- are configured (Scored)
#
# Description:
# The /etc/shadow- file is used to store backup information about user accounts that is critical to the security
# of those accounts, such as the hashed password and other security information.
#
# @summary 6.1.7 Ensure permissions on /etc/shadow- are configured (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_6_1_7
class secure_linux_cis::redhat7::cis_6_1_7 (
  Boolean $enforced = true,
) {

  if $enforced {

    case $facts['os']['family'] {
      'RedHat': {
        file {'/etc/shadow-':
          ensure => present,
          owner  => 'root',
          group  => 'root',
          mode   => '0000',
        }
      }
      'Debian': {
        file {'/etc/shadow-':
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
}
