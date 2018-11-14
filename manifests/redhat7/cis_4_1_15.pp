# 4.1.15 Ensure changes to system administration scope (sudoers) is collected (Scored)
#
# Description:
# Monitor scope changes for system administrations. If the system has been properly
# configured to force system administrators to log in as themselves first and then use the
# sudo command to execute privileged commands, it is possible to monitor changes in scope.
# The file /etc/sudoers will be written to when the file or its attributes have changed. The
# audit records will be tagged with the identifier "scope."
#
# Rationale:
# Changes in the /etc/sudoers file can indicate that an unauthorized change has been made
# to scope of system administrator activity.
#
# @summary 4.1.15 Ensure changes to system administration scope (sudoers) is collected (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_4_1_15
class secure_linux_cis::redhat7::cis_4_1_15 (
  Boolean $enforced = true,
) {

  if $enforced {

    file_line { 'audit.rules sudoers 1':
      ensure => present,
      path   => '/etc/audit/audit.rules',
      line   => '-w /etc/sudoers -p wa -k scope',
    }

    file_line { 'audit.rules sudoers 2':
      ensure => present,
      path   => '/etc/audit/audit.rules',
      line   => '-w /etc/sudoers.d/ -p wa -k scope',
    }
  }
}
