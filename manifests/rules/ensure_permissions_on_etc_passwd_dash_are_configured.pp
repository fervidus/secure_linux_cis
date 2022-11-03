# @api private
#  Ensure permissions on /etc/passwd- are configured (Scored)
#
# Description:
# The /etc/passwd- file contains backup user account information.
#
# @summary  Ensure permissions on /etc/passwd- are configured (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_permissions_on_etc_passwd_dash_are_configured
class secure_linux_cis::rules::ensure_permissions_on_etc_passwd_dash_are_configured {
  $os = "${facts['os']['name']}${facts['os']['release']['major']}"
  $mode = $os ? {
    'Debian10' => '0600',
    default    => '0644',
  }

  file { '/etc/passwd-':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => $mode,
  }
}
