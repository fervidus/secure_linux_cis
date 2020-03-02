# @api private
# 2 Ensure no users have .netrc files (Scored)
#
#
# Description:
# The .netrc file contains data for logging into a remote host for file transfers via FTP.
#
# @summary 2 Ensure no users have .netrc files (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_no_users_have_netrc_files
class secure_linux_cis::rules::ensure_no_users_have_netrc_files(
    Boolean $enforced = true,
) {
  if $enforced {
    file { '/usr/share/cis_scripts/netrc.sh':
      ensure   => file,
      schedule => 'harden_schedule',
      owner    => 'root',
      group    => 'root',
      mode     => '0700',
      content  => file('secure_linux_cis/netrc.sh'),
    }
    unless $facts[ 'netrc_files' ].empty {
      notify { 'n':
        message  => 'Not in compliance with CIS 2 (Scored). There are .netrc files on the system. Check the netrc_files fact for details',#lint:ignore:140chars
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
