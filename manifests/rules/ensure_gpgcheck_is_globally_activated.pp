#  Ensure gpgcheck is globally activated (Scored)
#
#
# Description:
# Most packages managers implement GPG key signing to verify package integrity during installation.
#
# @summary  Ensure gpgcheck is globally activated (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_gpgcheck_is_globally_activated

class secure_linux_cis::rules::ensure_gpgcheck_is_globally_activated {

  file_line { 'gpgcheck':
    ensure => present,
    path   => '/etc/yum.conf',
    line   => 'gpgcheck=1',
    match  => '^gpgcheck',
  }

}
