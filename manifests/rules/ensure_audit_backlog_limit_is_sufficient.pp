# @api private
#  Ensure audit_backlog_limit is sufficient (Not Scored)
#
# Description:
# The backlog limit has a default setting of 64
#
# Rationale:
# during boot if audit=1, then the backlog will hold 64 records. If more that 64 records are
# created during boot, auditd records will be lost and potential malicious activity could go
# undetected.
#
# @summary Ensure audit_backlog_limit is sufficient (Not Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_audit_backlog_limit_is_sufficient
class secure_linux_cis::rules::ensure_audit_backlog_limit_is_sufficient(
  Boolean $enforced = true,
) {
  if $enforced {
    kernel_parameter { 'audit_backlog_limit=8192':
      ensure   => present,
      bootmode => 'default',
    }
  }
}
