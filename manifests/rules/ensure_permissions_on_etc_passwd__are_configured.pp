# @api private
#  Ensure permissions on /etc/passwd- are configured (Scored)
#
# Description:
# The /etc/passwd- file contains backup user account information.
#
# @summary  Ensure permissions on /etc/passwd- are configured (Scored)
#
class secure_linux_cis::rules::ensure_permissions_on_etc_passwd__are_configured (
  Boolean $enforced = true,
) {
  if $enforced {
    $os = "${facts['os']['name']}${facts['os']['release']['major']}"
    $mode = $os ? {
      'Debian10' => '0600',
      default    => '0644',
    }

    file { '/etc/passwd-':
      ensure   => file,
      schedule => 'harden_schedule',
      owner    => 'root',
      group    => 'root',
      mode     => $mode,
    }
  }
}
