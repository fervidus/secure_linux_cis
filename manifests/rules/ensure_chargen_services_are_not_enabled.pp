# @api private
#
# @summary Ensure chargen services are not enabled 
#
class secure_linux_cis::rules::ensure_chargen_services_are_not_enabled {
  service { 'chargen-dgram':
    ensure => stopped,
    enable => false,
  }
  service { 'chargen-stream':
    ensure => stopped,
    enable => false,
  }
}
