# @api private
#
# @summary Ensure permissions on /etc/motd are configured 
#
class secure_linux_cis::rules::ensure_permissions_on_etc_motd_are_configured {
  unless $secure_linux_cis::motd and $secure_linux_cis::banner {
    $motd_real = $secure_linux_cis::banner
  }
  else {
    $motd_real = $secure_linux_cis::motd
  }
  file { '/etc/motd':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => $motd_real,
  }
}
