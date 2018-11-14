# 2.2.1.1 Ensure time synchronization is in use (Not Scored)
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
# @summary 2.2.1.1 Ensure time synchronization is in use (Not Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_2_2_1_1
class secure_linux_cis::redhat7::cis_2_2_1_1 {

  # This benchmark is handled by either secure_linux_cis::redhat7::cis_2_2_1_2
  # or secure_linux_cis::redhat7::cis_2_2_1_3 depending on whether ntp or
  # chrony is used for time synchronization.

}
