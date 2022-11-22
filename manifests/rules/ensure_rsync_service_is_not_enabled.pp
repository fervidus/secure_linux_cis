# @api private
#
# @summary Ensure rsync service is not enabled 
#
class secure_linux_cis::rules::ensure_rsync_service_is_not_enabled {
  service { ['rsyncd', 'rsync']:
    ensure => stopped,
    enable => false,
  }
}
