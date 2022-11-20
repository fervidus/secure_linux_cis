# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_journald_service_is_enabled {
  service { 'systemd-journald':
    ensure => running,
    enable => true,
  }
}
