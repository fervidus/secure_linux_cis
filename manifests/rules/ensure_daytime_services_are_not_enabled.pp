# @api private
#
# @summary Ensure daytime services are not enabled 
#
class secure_linux_cis::rules::ensure_daytime_services_are_not_enabled {
  service { 'daytime-dgram':
    ensure => stopped,
    enable => false,
  }
  service { 'daytime-stream':
    ensure => stopped,
    enable => false,
  }
}
