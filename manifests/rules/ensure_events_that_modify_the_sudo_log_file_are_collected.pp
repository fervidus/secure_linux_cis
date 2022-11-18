# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_events_that_modify_the_sudo_log_file_are_collected
class secure_linux_cis::rules::ensure_events_that_modify_the_sudo_log_file_are_collected {
  file { '/etc/audit/rules.d/50-sudo.rules':
    ensure  => file,
    content => '-w /var/log/sudo.log -p wa -k sudo_log_file',
  }

  Class['secure_linux_cis::rules::ensure_events_that_modify_the_sudo_log_file_are_collected']
  ~> Class['secure_linux_cis::refresh_mount_options']
}
