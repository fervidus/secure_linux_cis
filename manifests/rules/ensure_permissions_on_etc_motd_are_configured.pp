# @api private
#  Ensure permissions on /etc/motd are configured (Not Scored)
#
#
# Description:
# The contents of the /etc/motd file are displayed to users after login and function as a message of the day for authenticated users.
#
# @summary  Ensure permissions on /etc/motd are configured (Not Scored)
#
# @param enforced Should this rule be enforced
# @param banner Text of the motd, if $motd is empty
# @param motd Text of the motd
#
# @example
#   include secure_linux_cis::ensure_permissions_on_etc_motd_are_configured
class secure_linux_cis::rules::ensure_permissions_on_etc_motd_are_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    unless $::secure_linux_cis::motd and $::secure_linux_cis::banner {
      $motd_real = $::secure_linux_cis::banner
    }
    else {
      $motd_real = $::secure_linux_cis::motd
    }
    file { '/etc/motd':
      ensure   => present,
      schedule => 'harden_schedule',
      owner    => 'root',
      group    => 'root',
      mode     => '0644',
      content  => $motd_real,
    }
  }
}
