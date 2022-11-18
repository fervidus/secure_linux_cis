# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_rsyslog_default_file_permissions_are_configured
class secure_linux_cis::rules::ensure_rsyslog_default_file_permissions_are_configured {
  file { '/etc/rsyslog.conf':
    ensure => file,
    mode   => 'u-x,g-wx,o-rwx',
  }
  ~> Service['rsyslog']
}
