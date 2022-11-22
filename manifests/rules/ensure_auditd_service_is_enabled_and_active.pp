# @api private
#
# @summary Ensure auditd service is enabled and active 
#
class secure_linux_cis::rules::ensure_auditd_service_is_enabled_and_active {
  include secure_linux_cis::rules::ensure_auditd_service_is_enabled_and_running
}
