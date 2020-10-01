# @api private
#  Ensure default user shell timeout is 900 seconds or less (Scored)
#
#
# Description:
# The default TMOUT determines the shell timeout for users. The TMOUT value is measured in seconds.
#
# @summary  Ensure default user shell timeout is 900 seconds or less (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_default_user_shell_timeout_is_900_seconds_or_less
class secure_linux_cis::rules::ensure_default_user_shell_timeout_is_900_seconds_or_less(
    Boolean $enforced = true,
) {
  if $enforced {
    $bashrc = $facts['osfamily'] ? {
      'RedHat' => '/etc/bashrc',
      'Suse'   => '/etc/bash.bashrc',
      'Debian' => '/etc/bash.bashrc',
    }
    $paths = [
      $bashrc,
      '/etc/profile',
    ]
    $paths.each | $path | {
      file_line { "${path}_tmout":
        schedule => 'harden_schedule',
        path     => $path,
        line     => "TMOUT=${::secure_linux_cis::timeout}",
        after    => 'BASHRCSOURCED="Y"', # For RedHat8
      }
      file_line { "${path}_export_tmout":
        schedule => 'harden_schedule',
        path     => $path,
        line     => 'export TMOUT',
      }
    }
    # We want to set the variable TMOUT readonly only in the last file
    # processed. This to avoid the message 'TMOUT: readonly variable' at
    # login. Unfortunately, different distributions parse these files in
    # different orders.
    $readonly_file = "${facts['os']['family']}${facts['os']['release']['major']}" ? {
      'RedHat8' => '/etc/profile',
      /RedHat/  => '/etc/bashrc',
      default   => '/etc/profile',
    }
    file_line { "${readonly_file} readonly tmout":
      schedule => 'harden_schedule',
      path     => $readonly_file,
      line     => 'readonly TMOUT',
    }
  }
}
