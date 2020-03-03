# @api private
#  Ensure syslog-ng default file permissions configured (Scored)
#
# Description:
# syslog-ng will create logfiles that do not already exist on the system. This setting controls
# what permissions will be applied to these newly created files.
#
# Rationale:
# It is important to ensure that log files exist and have the correct permissions to ensure that
# sensitive syslog-ng data is archived and protected.
#
# @summary  Ensure syslog-ng default file permissions configured (Scored)
#
# @param enforced Should this rule be enforced
# @param logging How logging is done
#
# @example
#   include secure_linux_cis::ensure_syslog_ng_default_file_permissions_configured
class secure_linux_cis::rules::ensure_syslog_ng_default_file_permissions_configured(
    Boolean $enforced = true,
) {

  Class['secure_linux_cis::rules::ensure_syslog_ng_default_file_permissions_configured']
  ~> Class['::secure_linux_cis::reboot']

  if $enforced {
    if $::secure_linux_cis::logging == 'syslog-ng' {
      file_line { 'syslog-ng.conf permissions':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/syslog-ng/syslog-ng.conf',
        line     => 'options { chain_hostnames(off); flush_lines(0); perm(0640); stats_freq(3600); threaded(yes); };',
      }
    }
  }
}
