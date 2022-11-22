# @api private
#
# @summary Ensure permissions on /etc/group are configured 
#
class secure_linux_cis::rules::ensure_permissions_on_etc_group_are_configured {
  file { '/etc/group':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
}
