# @api private
#  Ensure /etc/hosts.allow is configured (Scored)
#
# Description:
# The /etc/hosts.allow file specifies which IP addresses are permitted to connect to the host.
# It is intended to be used in conjunction with the /etc/hosts.deny file.
#
# Rationale:
# The /etc/hosts.allow file supports access control by IP and helps ensure that only authorized systems can connect to the system.
#
#  Ensure permissions on /etc/hosts.allow are configured (Scored)
#
# Description:
# The /etc/hosts.allow file contains networking information that is used by many
# applications and therefore must be readable for these applications to operate.
#
# Rationale:
# It is critical to ensure that the /etc/hosts.allow file is protected from unauthorized write
# access. Although it is protected by default, the file permissions could be changed either
# inadvertently or through malicious actions.
#
#
# @summary  Ensure /etc/hosts.allow is configured (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_etc_hosts_allow_is_configured
class secure_linux_cis::rules::ensure_etc_hosts_allow_is_configured(
    Boolean $enforced = true,
) {
  $allow_content = join($::secure_linux_cis::host_allow_rules, "\n")

  if $enforced {
    # This file manages both benchmarks 3_4_2 and 3_4_4
    file { '/etc/hosts.allow':
      ensure   => file,
      schedule => 'harden_schedule',
      owner    => 'root',
      group    => 'root',
      mode     => '0644',
      content  => "${allow_content}\n",
    }
  }
}
