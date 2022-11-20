# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_rsync_is_not_installed_or_the_rsyncd_service_is_masked {
  package { 'rsync':
    ensure => absent,
  }
}
