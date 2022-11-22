# @api private
#
# @summary Ensure audit_backlog_limit is sufficient 
#
class secure_linux_cis::rules::ensure_audit_backlog_limit_is_sufficient {
  kernel_parameter { 'audit_backlog_limit=8192':
    ensure   => present,
    bootmode => 'default',
  }
}
