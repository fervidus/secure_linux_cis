# @api private
#  Ensure suspicious packets are logged (Scored)
#
# Description:
# When enabled, this feature logs packets with un-routable source addresses to the kernel log.
#
# Rationale:
# Enabling this feature and logging these packets allows an administrator to investigate the
# possibility that an attacker is sending spoofed packets to their system.
#
# @summary  Ensure suspicious packets are logged (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_suspicious_packets_are_logged
class secure_linux_cis::rules::ensure_suspicious_packets_are_logged(
    Boolean $enforced = true,
) {
  if $enforced {
    sysctl { 'net.ipv4.conf.all.log_martians':
      value    => 1,
      schedule => 'harden_schedule',
    }
    sysctl { 'net.ipv4.conf.default.log_martians':
      value    => 1,
      schedule => 'harden_schedule',
    }
  }
}
