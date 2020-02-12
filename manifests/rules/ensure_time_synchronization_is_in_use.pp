# @api private
#  Ensure time synchronization is in use (Not Scored)
#
# Description:
# System time should be synchronized between all systems in an environment. This is
# typically done by establishing an authoritative time server or set of servers and having all
# systems synchronize their clocks to them.
# Rationale:
# Time synchronization is important to support time sensitive security mechanisms like
# Kerberos and also ensures log files have consistent time records across the enterprise,
# which aids in forensic investigations.
#
# @summary  Ensure time synchronization is in use (Not Scored)
#
# # @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_time_synchronization_is_in_use
class secure_linux_cis::rules::ensure_time_synchronization_is_in_use(
    Boolean $enforced = false,
) {
  # This benchmark is handled by either secure_linux_cis::ensure_time_synchronization_is_in_use
  # or secure_linux_cis::ensure_time_synchronization_is_in_use depending on whether ntp or
  # chrony is used for time synchronization.
}
