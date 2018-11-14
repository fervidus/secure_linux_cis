# 3.2.4 Ensure suspicious packets are logged (Scored)
#
# Description:
# When enabled, this feature logs packets with un-routable source addresses to the kernel log.
#
# Rationale:
# Enabling this feature and logging these packets allows an administrator to investigate the
# possibility that an attacker is sending spoofed packets to their system.
#
# @summary 3.2.4 Ensure suspicious packets are logged (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_3_2_4
class secure_linux_cis::redhat7::cis_3_2_4 (
  Boolean $enforced = true,
) {

  if $enforced {
    sysctl { 'net.ipv4.conf.all.log_martians':
      value => 1,
    }

    sysctl { 'net.ipv4.conf.default.log_martians':
      value => 1,
    }
  }
}
