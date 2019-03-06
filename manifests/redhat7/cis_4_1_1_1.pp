# 4.1.1.1 Ensure audit log storage size is configured (Not Scored)
#
# Description:
# Configure the maximum size of the audit log file. Once the log reaches the maximum size, it
# will be rotated and a new log file will be started.
#
# Rationale:
# It is important that an appropriate size is determined for log files so that they do not impact
# the system and audit data is not lost.
#
# @summary 4.1.1.1 Ensure audit log storage size is configured (Not Scored)
#
# @param max_log_file The maximum size of the audit log file (MB) for your organization's policy.
#
# @example
#   include secure_linux_cis::redhat7::cis_4_1_1_1
class secure_linux_cis::redhat7::cis_4_1_1_1 (
  Boolean $enforced     = true,
  Integer $max_log_file = 8,
) {

  if $enforced {

    file_line { 'max_log_file':
      ensure => present,
      path   => '/etc/audit/auditd.conf',
      line   => "max_log_file = ${max_log_file}",
      match  => '^max_log_file =',
    }
  }
}
