# 1.6.1.5 Ensure the MCS Translation Service (mcstrans) is not installed (Scored)
#
#
# Description:
# The mcstransd daemon provides category label information to client processes requesting information. The label
# translations are defined in /etc/selinux/targeted/setrans.conf
#
# @summary 1.6.1.5 Ensure the MCS Translation Service (mcstrans) is not installed (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_6_1_5
class secure_linux_cis::redhat7::cis_1_6_1_5 (
  Boolean $enforced = true,
) {

  if $enforced {

    package { 'mcstrans':
      ensure => purged,
    }
  }
}
