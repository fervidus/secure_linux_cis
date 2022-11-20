# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_auditd_service_is_enabled_and_running {
  service { 'auditd':
    ensure => running,
    enable => true,
  }
}
