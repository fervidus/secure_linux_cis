# 1.2.2 Ensure gpgcheck is globally activated (Scored)
#
#
# Description:
# Most packages managers implement GPG key signing to verify package integrity during installation.
#
# @summary 1.2.2 Ensure gpgcheck is globally activated (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::distribution::redhat7::cis_1_2_2
class secure_linux_cis::distribution::redhat7::cis_1_2_2 (
  Boolean $enforced = true,
) {

  if $enforced {

    file_line { 'gpgcheck':
      ensure => present,
      path   => '/etc/yum.conf',
      line   => 'gpgcheck=1',
      match  => '^gpgcheck',
    }

  }
}
