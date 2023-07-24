# @api private
#
# @summary Ensure host based firewall loopback traffic is configured
#
class secure_linux_cis::rules::ensure_host_based_firewall_loopback_traffic_is_configured {
  exec { "Ensure host based firewall loopback traffic is configured":
    command   => "/usr/share/cis_scripts/ensure_host_based_firewall_loopback_traffic_is_configured.sh",
    logoutput => true,
  }
}
