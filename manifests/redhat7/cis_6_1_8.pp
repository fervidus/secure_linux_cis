# 6.1.8 Ensure permissions on /etc/group- are configured (Scored)
#
# Description:
# The /etc/group- file contains a backup list of all the valid groups defined in the system.
#
# @summary 6.1.8 Ensure permissions on /etc/group- are configured (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_1_8
class secure_linux_cis::redhat7::cis_6_1_8 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/etc/group-':
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
  }
}
