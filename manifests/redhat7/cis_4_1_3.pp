# 4.1.3 Ensure auditing for processes that start prior to auditd is enabled (Scored)
#
# Description:
# Configure grub so that processes that are capable of being audited can be audited even if
# they start up prior to auditd startup.
#
# Rationale:
# Audit events need to be captured on processes that start up prior to auditd, so that
# potential malicious activity cannot go undetected.
#
# @summary A short summary of the purpose of this class
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_4_1_3
class secure_linux_cis::redhat7::cis_4_1_3 (
  Boolean $enforced = true,
) {

  if $enforced {

    kernel_parameter { 'audit=1':
      ensure => present,
    }

  }
}
