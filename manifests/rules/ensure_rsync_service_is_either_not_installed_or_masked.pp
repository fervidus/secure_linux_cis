# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_rsync_service_is_either_not_installed_or_masked
class secure_linux_cis::rules::ensure_rsync_service_is_either_not_installed_or_masked {
  package { 'rsync':
    ensure => absent,
  }
}
