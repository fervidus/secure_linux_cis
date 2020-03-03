# @api private
# 3 Ensure SSH LoginGraceTime is set to one minute or less (Scored)
#
# Description:
# The LoginGraceTime parameter specifies the time allowed for successful authentication to the SSH server. The longer the Grace period is
# the more open unauthenticated connections can exist. Like other session controls in this session the Grace Period should be limited to
# appropriate organizational limits to ensure the service is available for needed access.
#
# Rationale:
# Setting the LoginGraceTime parameter to a low number will minimize the risk of successful brute force attacks to the SSH server. It will
# also limit the number of concurrent unauthenticated connections While the recommended setting is 60 seconds (1 Minute), set the number
# based on site policy.
#
# @summary 3 Ensure SSH LoginGraceTime is set to one minute or less (Scored)
#
# @param enforced Should this rule be enforced
# @param login_grace_time Login grace time
#
# @example
#   include secure_linux_cis::ensure_ssh_logingracetime_is_set_to_one_minute_or_less
class secure_linux_cis::rules::ensure_ssh_logingracetime_is_set_to_one_minute_or_less(
    Boolean $enforced = true,
) {
  if $enforced {
    include ::secure_linux_cis::service
    if $::secure_linux_cis::login_grace_time > 60 or $::secure_linux_cis::login_grace_time < 1 {
      fail('The Login Grace Time parameter has been manually set past the 1 - 60 threshold')
    }
    file_line{ 'ssh login grace time':
      ensure   => 'present',
      schedule => 'harden_schedule',
      path     => '/etc/ssh/sshd_config',
      line     => "LoginGraceTime ${::secure_linux_cis::login_grace_time}",
      match    => '^#?LoginGraceTime',
      notify   => Exec['reload sshd'],
    }
  }
}
