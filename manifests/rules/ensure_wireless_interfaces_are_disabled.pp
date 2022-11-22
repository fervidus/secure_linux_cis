# @api private
#
# @summary Ensure wireless interfaces are disabled 
#
class secure_linux_cis::rules::ensure_wireless_interfaces_are_disabled {
  $facts['networking']['interfaces'].each | String $name, Hash $attributes | {
    if $name =~ /wlan/ {
      exec { "Disable wireless network interface: ${name}":
        command   => "/sbin/ip link set ${name} down",
        onlyif    => "/sbin/ip link show ${name} |grep 'state UP'",
        logoutput => true,
      }
    }
  }
}
