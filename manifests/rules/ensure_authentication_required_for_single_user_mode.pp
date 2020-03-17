# @api private
#  Ensure authentication required for single user mode (Scored)
#
#
# Description:
# ingle user mode (rescue mode) is used for recovery when the system detects an issue during boot or by
# manual selection from the bootloader.
#
# @summary  Ensure authentication required for single user mode (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_authentication_required_for_single_user_mode
class secure_linux_cis::rules::ensure_authentication_required_for_single_user_mode(
    Boolean $enforced = true,
) {
  if $enforced {
    $os = "${facts['os']['name']}${facts['os']['release']['major']}"
    case $os {
      'Debian8', 'Debian9', 'Debian10', 'Ubuntu18.04': {
        unless $facts['rootpw`'].empty {
          notify { 'rootpw':
            message  => 'Not in compliance with CIS 1.4.3 (Scored). No authentication required for single user mode.',#lint:ignore:140chars
            schedule => 'harden_schedule',
            loglevel => 'warning',
          }
        }
      }
      default: {
        file_line { 'rescue':
          schedule => 'harden_schedule',
          path     => '/usr/lib/systemd/system/rescue.service',
          line     => 'ExecStart=-/bin/sh -c "/sbin/sulogin; /usr/bin/systemctl --fail --no-block default"',
          match    => '^ExecStart=',
        }

        file_line { 'emergency':
          schedule => 'harden_schedule',
          path     => '/usr/lib/systemd/system/emergency.service',
          line     => 'ExecStart=-/bin/sh -c "/sbin/sulogin; /usr/bin/systemctl --fail --no-block default"',
          match    => '^ExecStart=',
        }
      }
    }
  }
}
