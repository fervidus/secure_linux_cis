# @api private
#
# @summary Ensure audit log storage size is configured 
#
class secure_linux_cis::rules::ensure_audit_log_storage_size_is_configured {
  # require secure_linux_cis::rules::ensure_auditd_service_is_enabled
  file_line { 'max_log_file':
    ensure => present,
    path   => '/etc/audit/auditd.conf',
    line   => "max_log_file = ${secure_linux_cis::max_log_file}",
    match  => '^\s*max_log_file\s*=',
  }
}
