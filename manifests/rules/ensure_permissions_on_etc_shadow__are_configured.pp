# @api private
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
#   include secure_linux_cis::ensure_permissions_on_etc_shadow__are_configured
class secure_linux_cis::rules::ensure_permissions_on_etc_shadow__are_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    $os = "${facts['os']['name']}${facts['os']['release']['major']}"
    $mode = $os ? {
      'Debian10'    => '0600',
      'Debian9'     => '0640',
      'Ubuntu16.04' => '0640',
      'Ubuntu18.04' => '0640',
      default       => '0000',
    }

    case $facts['osfamily'] {
      'RedHat': {
        file {'/etc/shadow-':
          ensure   => present,
          schedule => 'harden_schedule',
          owner    => 'root',
          group    => 'root',
          mode     => '0000',
        }
      }
      'Debian': {
        file {'/etc/shadow-':
          ensure   => present,
          schedule => 'harden_schedule',
          owner    => 'root',
          group    => 'shadow',
          mode     => $mode,
        }
      }
      default: {
        warning ("shadow- configuration not supported on os family ${facts['osfamily']}.")
      }
    }
  }
}
