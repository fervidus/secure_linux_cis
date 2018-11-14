# 4.1.1.2 Ensure system is disabled when audit logs are full (Scored)
#
# Description:
# The auditd daemon can be configured to halt the system when the audit logs are full.
#
# Rationale:
# In high security contexts, the risk of detecting unauthorized access or nonrepudiation
# exceeds the benefit of the system's availability.
#
# @summary 4.1.1.2 Ensure system is disabled when audit logs are full (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_4_1_1_2
class secure_linux_cis::redhat7::cis_4_1_1_2 (
  Boolean $enforced = true,
) {

  if $enforced {

    file_line { 'space_left_action':
      ensure => present,
      path   => '/etc/audit/auditd.conf',
      line   => 'space_left_action = email',
      match  => '^space_left_action',
    }

    file_line { 'action_mail_acct':
      ensure => present,
      path   => '/etc/audit/auditd.conf',
      line   => 'action_mail_acct = root',
      match  => '^action_mail_acct',
    }

    file_line { 'admin_space_left_action':
      ensure => present,
      path   => '/etc/audit/auditd.conf',
      line   => 'admin_space_left_action = halt',
      match  => '^admin_space_left_action',
    }

  }

}
