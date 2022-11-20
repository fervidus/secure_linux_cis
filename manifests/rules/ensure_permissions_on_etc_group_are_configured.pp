# @api private
#  Ensure permissions on /etc/group- are configured (Scored)
#
# Description:
# The /etc/group- file contains a backup list of all the valid groups defined in the system.
#
# @summary  Ensure permissions on /etc/group- are configured (Scored)
#
class secure_linux_cis::rules::ensure_permissions_on_etc_group_are_configured {
  file { '/etc/group':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
}
