# 1.7.1.5 Ensure permissions on /etc/issue are configured (Scored)
#
#
# Description:
# The contents of the /etc/issue file are displayed to users prior to login for local terminals.
#
# @summary 1.7.1.5 Ensure permissions on /etc/issue are configured (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_7_1_5
class secure_linux_cis::redhat7::cis_1_7_1_5 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/etc/motd':
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
  }
}
