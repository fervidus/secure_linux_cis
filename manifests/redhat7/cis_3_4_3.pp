# 3.4.3 Ensure /etc/hosts.deny is configured (Scored)
#
# Description:
# The /etc/hosts.deny file specifies which IP addresses are not permitted to connect to the host.
# It is intended to be used in conjunction with the /etc/hosts.allow file.
#
# Rationale:
# The /etc/hosts.deny file serves as a failsafe so that any host not specified in /etc/hosts.allow is denied access to the system.
#
# 3.4.5 Ensure permissions on /etc/hosts.deny are configured (Scored)
#
# Description:
# The /etc/hosts.deny file contains network information that is used by many system
# applications and therefore must be readable for these applications to operate.
#
# Rationale:
# It is critical to ensure that the /etc/hosts.deny file is protected from unauthorized write
# access. Although it is protected by default, the file permissions could be changed either
# inadvertently or through malicious actions.
#
# @summary 3.4.3 Ensure /etc/hosts.deny is configured (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_3_4_3
class secure_linux_cis::redhat7::cis_3_4_3 (
  Boolean $enforced = true,
) {

  if $enforced {

    # This file manages both benchmarks 3_4_3 and 3_4_5
    file { '/etc/hosts.deny':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => "ALL: ALL\n",
    }

  }
}
