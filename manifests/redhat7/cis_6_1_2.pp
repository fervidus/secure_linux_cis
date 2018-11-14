# 6.1.2 Ensure permissions on /etc/passwd are configured (Scored)
#
# Description:
# The /etc/passwd file contains user account information that is used by many system utilities and therefore must be readable for these
# utilities to operate.
#
# @summary 6.1.2 Ensure permissions on /etc/passwd are configured (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_1_2
class secure_linux_cis::redhat7::cis_6_1_2 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/etc/passwd':
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
  }
}
