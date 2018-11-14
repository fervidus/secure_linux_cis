# 3.2.5 Ensure broadcast ICMP requests are ignored (Scored)
#
# Description:
# Setting net.ipv4.icmp_echo_ignore_broadcasts to 1 will cause the system to ignore all ICMP echo and
# timestamp requests to broadcast and multicast addresses.
#
# Rationale:
# Accepting ICMP echo and timestamp requests with broadcast or multicast destinations for your network
# could be used to trick your host into starting (or participating) in a Smurf attack. A Smurf attack
# relies on an attacker sending large amounts of ICMP broadcast messages with a spoofed source address.
# All hosts receiving this message and responding would send echo-reply messages back to the spoofed address,
# which is probably not routable. If many hosts respond to the packets, the amount of traffic on the
# network could be significantly multiplied.
#
# @summary 3.2.5 Ensure broadcast ICMP requests are ignored (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_3_2_5
class secure_linux_cis::redhat7::cis_3_2_5 (
  Boolean $enforced = true,
) {

  if $enforced {
    sysctl { 'net.ipv4.icmp_echo_ignore_broadcasts':
      value => 1,
    }
  }
}
