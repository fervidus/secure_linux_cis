# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_permissions_on_etc_crond_are_configured
class secure_linux_cis::rules::ensure_permissions_on_etc_crond_are_configured {
  file { '/etc/cron.d':
    owner => 'root',
    group => 'root',
    mode  => 'og-rwx',
  }
}
