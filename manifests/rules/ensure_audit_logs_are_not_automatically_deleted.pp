# @api private
#
# @summary Ensure audit logs are not automatically deleted 
#
class secure_linux_cis::rules::ensure_audit_logs_are_not_automatically_deleted {
  # require secure_linux_cis::rules::ensure_auditd_service_is_enabled

  file_line { 'max_log_file_action':
    ensure => present,
    path   => '/etc/audit/auditd.conf',
    line   => 'max_log_file_action = keep_logs',
    match  => '^max_log_file_action',
  }
}
