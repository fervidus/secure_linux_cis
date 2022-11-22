# @api private
#
# @summary Ensure events that modify the sudo log file are collected 
#
class secure_linux_cis::rules::ensure_events_that_modify_the_sudo_log_file_are_collected {
  file { '/etc/audit/rules.d/50-sudo.rules':
    ensure  => file,
    content => '-w /var/log/sudo.log -p wa -k sudo_log_file',
  }

  Class['secure_linux_cis::rules::ensure_events_that_modify_the_sudo_log_file_are_collected']
  ~> Class['secure_linux_cis::refresh_mount_options']
}
