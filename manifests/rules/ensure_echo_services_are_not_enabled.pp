# @api private
#
# @summary Ensure echo services are not enabled 
#
class secure_linux_cis::rules::ensure_echo_services_are_not_enabled {
  service { 'echo-dgram':
    ensure => stopped,
    enable => false,
  }
  service { 'echo-stream':
    ensure => stopped,
    enable => false,
  }
}
