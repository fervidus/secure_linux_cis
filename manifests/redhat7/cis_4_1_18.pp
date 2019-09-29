# 4.1.18 Ensure the audit configuration is immutable (Scored)
#
# Description:
# Set system audit so that audit rules cannot be modified with auditctl.
# Setting the flag "-e 2" forces audit to be put in immutable mode. Audit changes can only be made
# on system reboot.
#
# Rationale:
# In immutable mode, unauthorized users cannot execute changes to the audit system
# to potentially hide malicious activity and then put the audit rules back.
# Users would most likely notice a system reboot and that could alert administrators of an attempt
# to make unauthorized audit changes.
#
# @summary 4.1.18 Ensure the audit configuration is immutable (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_4_1_18
class secure_linux_cis::redhat7::cis_4_1_18 (
  Boolean $enforced = true,
){

  if $enforced {

    file_line { 'audit.rules make immutable':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-e 2',
    }
  }
}
