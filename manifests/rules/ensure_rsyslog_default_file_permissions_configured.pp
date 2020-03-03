# @api private
#  Ensure rsyslog default file permissions configured (Scored)
#
# Description:
# rsyslog will create logfiles that do not already exist on the system. This setting controls
# what permissions will be applied to these newly created files.
#
# Rationale:
# It is important to ensure that log files have the correct permissions to ensure that sensitive
# data is archived and protected.
#
# @summary  Ensure rsyslog default file permissions configured (Scored)
#
# @param enforced Should this rule be enforced
# @param logging How logging is done
#
# @example
#   include secure_linux_cis::ensure_rsyslog_default_file_permissions_configured
class secure_linux_cis::rules::ensure_rsyslog_default_file_permissions_configured(
    Boolean $enforced = true,
) {

  Class['::secure_linux_cis::rules::ensure_rsyslog_default_file_permissions_configured']
  ~> Class['::secure_linux_cis::reboot']

  if $enforced {
    if $::secure_linux_cis::logging == 'rsyslog' {
      file_line { 'rsyslog.conf log_permissions':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/rsyslog.conf',
        line     => '$FileCreateMode 0640',
        match    => '^\$FileCreateMode.*',
      }
      file { '/etc/rsyslog.d/':
        ensure   => directory,
        schedule => 'harden_schedule',
        recurse  => true,
        mode     => '0640',
      }
    }
  }
}
