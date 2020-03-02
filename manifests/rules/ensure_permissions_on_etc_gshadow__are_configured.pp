# @api private
#  Ensure permissions on /etc/gshadow- are configured (Scored)
#
# Description:
# The /etc/gshadow- file is used to store backup information about groups that is critical to the security
# of those accounts, such as the hashed password and other security information.
#
# @summary  Ensure permissions on /etc/gshadow- are configured (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_permissions_on_etc_gshadow__are_configured
class secure_linux_cis::rules::ensure_permissions_on_etc_gshadow__are_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    case $facts['osfamily'] {
      'RedHat': {
        file {'/etc/gshadow-':
          ensure   => present,
          schedule => 'harden_schedule',
          owner    => 'root',
          group    => 'root',
          mode     => '0000',
        }
      }
      'Debian': {
        file {'/etc/gshadow-':
          ensure   => present,
          schedule => 'harden_schedule',
          owner    => 'root',
          group    => 'shadow',
          mode     => '0640',
        }
      }
      default: {
        warning ("gshadow- configuration not supported on os family ${facts['osfamily']}.")
      }
    }
  }
}
