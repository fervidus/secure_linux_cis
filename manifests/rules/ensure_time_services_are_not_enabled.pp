# @api private
#
# @summary Ensure time services are not enabled 
#
class secure_linux_cis::rules::ensure_time_services_are_not_enabled {
  service { 'time-dgram':
    ensure => stopped,
    enable => false,
  }
  service { 'time-stream':
    ensure => stopped,
    enable => false,
  }
}
