# 1.7.1.6 Ensure permissions on /etc/issue.net are configured (Not Scored)
#
#
# Description:
# The contents of the /etc/issue.net file are displayed to users prior to login for remote connections from configured services.
#
# @summary 1.7.1.6 Ensure permissions on /etc/issue.net are configured (Not Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_7_1_6

class secure_linux_cis::redhat7::cis_1_7_1_6 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/etc/issue.net':
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
  }
}
