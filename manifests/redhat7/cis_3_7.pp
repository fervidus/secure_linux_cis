# 3.7 Ensure wireless interfaces are disabled (Not Scored)
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
# @summary 3.7 Ensure wireless interfaces are disabled (Not Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_3_7
class secure_linux_cis::redhat7::cis_3_7 (
  Boolean $enforced = true,
) {

  if $enforced {

    $facts['networking']['interfaces'].each | String $name, Hash $attributes | {

      if $name =~ /wlan/ {

        exec { "Disable wireless network interface: ${name}":
          command => "/sbin/ip link set ${name} down",
        }
      }
    }
  }
}
