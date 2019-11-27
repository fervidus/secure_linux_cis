# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_firewalld_service_is_enabled_and_running
class secure_linux_cis::rules::ensure_firewalld_service_is_enabled_and_running(
    Boolean $enforced = false,
) {
  # This is already done by ensure_iptables_is_installed.pp
  # The class firewall which is included in that file already manages the
  # firewalld service
  # include secure_linux_cis::rules::ensure_iptables_is_installed
}
