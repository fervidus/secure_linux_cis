# @api private
#
# @summary Ensure auditing for processes that start prior to auditd is enabled 
#
class secure_linux_cis::rules::ensure_auditing_for_processes_that_start_prior_to_auditd_is_enabled {
  Class['secure_linux_cis::rules::ensure_auditing_for_processes_that_start_prior_to_auditd_is_enabled']
  ~> Class['secure_linux_cis']
  exec { 'Ensure auditing for processes that start prior to auditd is enabled':
    command   => "/usr/sbin/grubby --update-kernel ALL --args 'audit=1'",  #lint:ignore:140chars
    unless    => "/usr/bin/find /boot -type f -name 'grubenv' -exec grep -P 'kernelopts=([^#\\n\\r]+\\h+)?(audit=1)' {} \\;",  #lint:ignore:140chars
    logoutput => true,
  }
}
