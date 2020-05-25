# @param enforced Should this rule be enforced
# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_firewalld_service_is_enabled_and_running
class secure_linux_cis::rules::ensure_firewalld_service_is_enabled_and_running(
  Boolean $enforced = false,
) {
  if $enforced {
    include ::firewalld
  }
}
