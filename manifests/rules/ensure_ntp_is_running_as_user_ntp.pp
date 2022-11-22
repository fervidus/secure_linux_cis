# @api private
#
# @summary Ensure ntp is running as user ntp 
#
class secure_linux_cis::rules::ensure_ntp_is_running_as_user_ntp {
  file_line { 'Ensure ntp is running as user ntp':
    path  => '/etc/init.d/ntp',
    line  => 'RUNASUSER=ntp',
    match => '^\s*RUNASUSER',
  }

  Class['secure_linux_cis::rules::ensure_ntp_is_running_as_user_ntp']
  ~> Class['secure_linux_cis::rules::ensure_ntp_is_enabled_and_running']
}
