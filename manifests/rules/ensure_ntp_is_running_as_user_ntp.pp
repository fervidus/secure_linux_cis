# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_ntp_is_running_as_user_ntp
class secure_linux_cis::rules::ensure_ntp_is_running_as_user_ntp {
  file_line { 'Ensure ntp is running as user ntp':
    path  => '/etc/init.d/ntp',
    line  => 'RUNASUSER=ntp',
    match => '^\s*RUNASUSER',
  }

  Class['secure_linux_cis::rules::ensure_ntp_is_running_as_user_ntp']
  ~> Class['secure_linux_cis::rules::ensure_ntp_is_enabled_and_running']
}
