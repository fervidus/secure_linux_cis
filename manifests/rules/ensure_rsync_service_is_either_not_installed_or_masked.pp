# @api private
#
# @summary Ensure rsync service is either not installed or masked 
#
class secure_linux_cis::rules::ensure_rsync_service_is_either_not_installed_or_masked {
  package { 'rsync':
    ensure => absent,
  }
}
