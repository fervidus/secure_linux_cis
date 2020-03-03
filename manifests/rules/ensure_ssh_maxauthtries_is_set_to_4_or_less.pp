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
# @param enforced Should this rule be enforced
# @param max_auth_tries How many authorization attempts to allow
#
# @example
#   include secure_linux_cis::ensure_ssh_maxauthtries_is_set_to_4_or_less
class secure_linux_cis::rules::ensure_ssh_maxauthtries_is_set_to_4_or_less(
    Boolean $enforced = true,
) {
  if $enforced {
    include ::secure_linux_cis::service
    file_line { 'ssh max auth tries':
      ensure   => present,
      schedule => 'harden_schedule',
      path     => '/etc/ssh/sshd_config',
      line     => "MaxAuthTries ${::secure_linux_cis::max_auth_tries}",
      match    => '^#?MaxAuthTries',
      notify   => Exec['reload sshd'],
    }
  }
}
