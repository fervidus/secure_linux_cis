# @api private
#
# @summary Ensure permissions on /etc/passwd are configured 
#
class secure_linux_cis::rules::ensure_permissions_on_etc_passwd_are_configured {
  file { '/etc/passwd':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
}
