# 3.2.2 Ensure ICMP redirects are not accepted (Scored)
#
# Description:
# ICMP redirect messages are packets that convey routing information and tell your host (acting as a router)
# to send packets via an alternate path. It is a way of allowing an outside routing device to update your
# system routing tables. By setting net.ipv4.conf.all.accept_redirects to 0, the system will not accept any
# ICMP redirect messages, and therefore, won't allow outsiders to update the system's routing tables.
#
# Rationale:
# Attackers could use bogus ICMP redirect messages to maliciously alter the system routing tables and get
# them to send packets to incorrect networks and allow your system packets to be captured.
#
# @summary 3.2.2 Ensure ICMP redirects are not accepted (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_3_2_2
class secure_linux_cis::redhat7::cis_3_2_2 (
  Boolean $enforced = true,
) {

  if $enforced {
    sysctl { 'net.ipv4.conf.all.accept_redirects':
      value => 0,
    }

    sysctl { 'net.ipv4.conf.default.accept_redirects':
      value => 0,
    }
  }
}
