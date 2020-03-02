# @api private
#  Ensure wireless interfaces are disabled (Not Scored)
#
# Description:
# Wireless networking is used when wired networks are unavailable. Red Hat Enterprise
# Linux 7 contains a wireless tool kit to allow system administrators to configure and use
# wireless networks.
#
# Rationale:
# If wireless is not to be used, wireless devices can be disabled to reduce the potential attack
# surface.
#
# @summary  Ensure wireless interfaces are disabled (Not Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_wireless_interfaces_are_disabled
class secure_linux_cis::rules::ensure_wireless_interfaces_are_disabled(
    Boolean $enforced = true,
) {
  if $enforced {
    $facts['networking']['interfaces'].each | String $name, Hash $attributes | {
      if $name =~ /wlan/ {
        exec { "Disable wireless network interface: ${name}":
          command   => "/sbin/ip link set ${name} down",
          schedule  => 'harden_schedule',
          onlyif    => "/sbin/ip link show ${name} |grep 'state UP'",
          logoutput => true,
        }
      }
    }
  }
}
