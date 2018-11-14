# 5.2.13 Ensure SSH LoginGraceTime is set to one minute or less (Scored)
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
# @summary 5.2.13 Ensure SSH LoginGraceTime is set to one minute or less (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_5_2_13
class secure_linux_cis::redhat7::cis_5_2_13 (
  Boolean $enforced = true,
  Integer $login_grace_time = 60,
) {

  if $enforced {

    if $login_grace_time > 60 or $login_grace_time < 1 {

        fail('The Login Grace Time parameter has been manually set past the 1 - 60 threshold')
    }

      file_line{ 'ssh login grace time':
        ensure => 'present',
        path   => '/etc/ssh/sshd_config',
        line   => "LoginGraceTime ${login_grace_time}",
        match  => '^#?LoginGraceTime',
      }
    }
  }
