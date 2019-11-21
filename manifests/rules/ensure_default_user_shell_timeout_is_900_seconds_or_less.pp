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

class secure_linux_cis::rules::ensure_default_user_shell_timeout_is_900_seconds_or_less {

  $bashrc = $facts['os']['family'] ? {
    'RedHat' => '/etc/bashrc',
    'Debian' => '/etc/bash.bashrc',
  }

  $paths = [
    $bashrc,
    '/etc/profile',
  ]

  $paths.each | $path | {

    file_line { "${path}_tmout":
      path => $path,
      line => 'TMOUT=600',
    }

    file_line { "${path}_export_tmout":
      path => $path,
      line => 'export TMOUT',
    }
  }

  $readonly_file = $facts['os']['family'] ? {
    'RedHat' => '/etc/bashrc',
    default  => '/etc/profile',
  }
  file_line { "${readonly_file} readonly tmout":
    path => $readonly_file,
    line => 'readonly TMOUT',
  }
}

