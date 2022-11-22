# @api private
#
# @summary Ensure rsync service is not installed 
#
class secure_linux_cis::rules::ensure_rsync_service_is_not_installed {
  package { 'rsync':
    ensure => absent,
  }
}
