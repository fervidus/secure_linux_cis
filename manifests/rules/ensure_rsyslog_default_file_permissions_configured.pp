# @api private
#  Ensure rsyslog default file permissions configured (Scored)
#
# Description:
# rsyslog will create logfiles that do not already exist on the system. This setting controls
# what permissions will be applied to these newly created files.
#
# Rationale:
# It is important to ensure that log files have the correct permissions to ensure that sensitive
# data is archived and protected.
#
# @summary  Ensure rsyslog default file permissions configured (Scored)
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
