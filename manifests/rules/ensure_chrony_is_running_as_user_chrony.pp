# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_chrony_is_running_as_user_chrony
class secure_linux_cis::rules::ensure_chrony_is_running_as_user_chrony {
  if $secure_linux_cis::time_sync == 'chrony' {
    file_line { 'ensure_chrony_is_running_as_user_chrony':
      path  => '/etc/chrony/chrony.conf',
      line  => 'user _chrony',
      match => '^\s*user',
    }
  }
}
