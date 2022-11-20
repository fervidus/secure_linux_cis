# @api private
#  Ensure SSH MaxAuthTries is set to 4 or less (Scored)
#
# Description:
# The MaxAuthTries parameter specifies the maximum number of authentication attempts permitted per connection. When the login failure count
# reaches half the number, error messages will be written to the syslog file detailing the login failure.
#
# Rationale:
# Setting the MaxAuthTries parameter to a low number will minimize the risk of successful brute force attacks to the SSH server. While the
# recommended setting is 4, set the number based on site policy.
#
# @summary  Ensure SSH MaxAuthTries is set to 4 or less (Scored)
#
class secure_linux_cis::rules::ensure_ssh_maxauthtries_is_set_to_4_or_less {
  include secure_linux_cis::sshd_service

  file_line { 'ssh max auth tries':
    ensure => present,
    path   => '/etc/ssh/sshd_config',
    line   => "MaxAuthTries ${secure_linux_cis::max_auth_tries}",
    match  => '^\s*MaxAuthTries',
    notify => Class['secure_linux_cis::sshd_service'],
  }
}
