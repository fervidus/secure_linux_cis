# 5.4.5 Ensure default user shell timeout is 900 seconds or less (Scored)
#
#
# Description:
# The default TMOUT determines the shell timeout for users. The TMOUT value is measured in seconds.
#
# @summary 5.4.5 Ensure default user shell timeout is 900 seconds or less (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_5_4_5
class secure_linux_cis::redhat7::cis_5_4_5 (
  Boolean $enforced = true,
) {

  $paths = [
    '/etc/bashrc',
    '/etc/profile',
  ]

  if $enforced {

    $paths.each | $path | {

      file_line { "${path}_tmout":
        path => $path,
        line => 'TMOUT=600',
      }

      file_line { "${path}_export_tmout":
        path => $path,
        line => 'export TMOUT',
      }

      file_line { "${path}_readonly_tmout":
        path => $path,
        line => 'readonly TMOUT',
      }
    }
  }
}
