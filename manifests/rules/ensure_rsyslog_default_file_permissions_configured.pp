# @api private
#
# @summary Ensure rsyslog default file permissions configured 
#
class secure_linux_cis::rules::ensure_rsyslog_default_file_permissions_configured {
  Class['secure_linux_cis::rules::ensure_rsyslog_default_file_permissions_configured']
  ~> Class['secure_linux_cis::reboot']

  file { '/etc/rsyslog.d/file_create_mode.conf':
    ensure  => file,
    path    => '/etc/rsyslog.d/file_create_mode.conf',
    content => '$FileCreateMode 0640',
  }

  file { '/etc/rsyslog.d':
    ensure  => directory,
    recurse => true,
    mode    => '0640',
  }
}
