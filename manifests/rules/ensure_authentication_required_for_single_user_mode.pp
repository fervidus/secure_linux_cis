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
class secure_linux_cis::ensure_authentication_required_for_single_user_mode (
  Boolean $enforced = true,
) {

  if $enforced {

    file_line { 'rescue':
      path  => '/usr/lib/systemd/system/rescue.service',
      line  => 'ExecStart=-/bin/sh -c "/sbin/sulogin; /usr/bin/systemctl --fail --no-block default"',
      match => '^ExecStart=',
    }
    file_line { 'emergency':
      path  => '/usr/lib/systemd/system/emergency.service',
      line  => 'ExecStart=-/bin/sh -c "/sbin/sulogin; /usr/bin/systemctl --fail --no-block default"',
      match => '^ExecStart=',
    }

  }
}
