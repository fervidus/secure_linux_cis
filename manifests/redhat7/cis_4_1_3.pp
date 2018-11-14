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
# @example
#   include secure_linux_cis::redhat7::cis_4_1_3
class secure_linux_cis::redhat7::cis_4_1_3 (
  Boolean $enforced = true,
) {

  if $enforced {

    shellvar { 'GRUB_CMDLINE_LINUX cis_4_1_3':
      ensure       => present,
      variable     => 'GRUB_CMDLINE_LINUX',
      target       => '/etc/default/grub',
      value        => 'audit=1',
      array_append => true,
      notify       => Exec['reload grub2 configuration 4_1_3'],
    }

    exec { 'reload grub2 configuration 4_1_3':
      command     => '/sbin/grub2-mkconfig -o /boot/grub2/grub.cfg',
      refreshonly => true,
    }
  }
}
