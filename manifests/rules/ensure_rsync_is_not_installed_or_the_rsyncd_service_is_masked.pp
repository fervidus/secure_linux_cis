# @api private
#
# @summary Ensure rsync is not installed or the rsyncd service is masked 
#
class secure_linux_cis::rules::ensure_rsync_is_not_installed_or_the_rsyncd_service_is_masked {
  package { 'rsync':
    ensure => absent,
  }
}
