# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_augenrules_is_enabled
class secure_linux_cis::rules::ensure_augenrules_is_enabled {
  file_line {'augenrules_enabled':
    ensure => present,
    path   => '/etc/sysconfig/auditd',
    line   => 'USE_AUGENRULES="yes"',
    match  => '^\s*USE_AUGENRULES\s*=',
  }
}
