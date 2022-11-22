# @api private
#
# @summary Ensure discard services are not enabled 
#
class secure_linux_cis::rules::ensure_discard_services_are_not_enabled {
  service { 'discard-dgram':
    ensure => stopped,
    enable => false,
  }
  service { 'discard-stream':
    ensure => stopped,
    enable => false,
  }
}
