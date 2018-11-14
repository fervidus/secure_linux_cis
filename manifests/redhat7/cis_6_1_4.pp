# 6.1.4 Ensure permissions on /etc/group are configured (Scored)
#
# Description:
# The /etc/group file contains a list of all the valid groups defined in the system. The command below
# allows read/write access for root and read access for everyone else.
#
# @summary 6.1.4 Ensure permissions on /etc/group are configured (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_1_4
class secure_linux_cis::redhat7::cis_6_1_4 (
  Boolean $enforced = true,
) {

  if $enforced {

    file {'/etc/group':
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
  }
}
