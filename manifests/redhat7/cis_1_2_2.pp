# 1.2.2 Ensure gpgcheck is globally activated (Scored)
#
#
# Description:
# The gpgcheck option, found in the main section of the /etc/yum.conf and individual /etc/yum/repos.d/*
# files determines if an RPM package's signature is checked prior to its installation.
#
# @summary 1.2.2 Ensure gpgcheck is globally activated (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_2_2
class secure_linux_cis::redhat7::cis_1_2_2 (
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
