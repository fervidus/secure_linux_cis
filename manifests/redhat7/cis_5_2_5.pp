# 5.2.5 Ensure SSH MaxAuthTries is set to 4 or less (Scored)
#
# Description:
# The MaxAuthTries parameter specifies the maximum number of authentication attempts permitted per connection. When the login failure count
# reaches half the number, error messages will be written to the syslog file detailing the login failure.
#
# Rationale:
# Setting the MaxAuthTries parameter to a low number will minimize the risk of successful brute force attacks to the SSH server. While the
# recommended setting is 4, set the number based on site policy.
#
# @summary 5.2.5 Ensure SSH MaxAuthTries is set to 4 or less (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_5_2_5
class secure_linux_cis::redhat7::cis_5_2_5 (
  Boolean $enforced = true,
  Enum['1', '2', '3', '4'] $max_auth_tries = '4',
) {

  if $enforced {

    file_line { 'ssh max auth tries':
    ensure => present,
    path   => '/etc/ssh/sshd_config',
    line   => "MaxAuthTries ${max_auth_tries}",
    match  => '^#?MaxAuthTries',
    }
  }
}
