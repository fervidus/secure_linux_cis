# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_systemd_timesyncd_is_configured
class secure_linux_cis::rules::ensure_systemd_timesyncd_is_configured {
  file { '/etc/systemd/timesyncd.conf':
    ensure => file,
  }
}
