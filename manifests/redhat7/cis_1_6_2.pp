# 1.6.2 Ensure SELinux is installed (Scored)
#
#
# Description:
# SELinux provides Mandatory Access Controls.
#
# @summary 1.6.2 Ensure SELinux is installed (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_6_2
class secure_linux_cis::redhat7::cis_1_6_2 (
  Boolean $enforced = true,
) {

  if $enforced {

    package { 'libselinux':
      ensure => present,
    }
  }
}
