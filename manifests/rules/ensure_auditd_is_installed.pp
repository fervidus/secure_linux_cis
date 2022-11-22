# @api private
#
# @summary Ensure auditd is installed 
#
class secure_linux_cis::rules::ensure_auditd_is_installed {
  # Note: CIS also wants package auditd installed. This is a dependency of
  # audispd-plugins, and also managed by
  # secure_linux_cis::ensure_auditd_service_is_enabled, so should not be
  # listed in this class also.
  package { 'audispd-plugins':
    ensure   => installed,
  }
}
