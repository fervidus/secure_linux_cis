# 5.6 Ensure access to the su command is restricted (Scored)
#
#
# Description:
# The su command allows a user to run a command or shell as another user. The program has been superseded by sudo , which allows for more
# granular control over privileged access. Normally, the su command can be executed by any user. By uncommenting the pam_wheel.so
# statement in /etc/pam.d/su , the su command will only allow users in the wheel group to execute su .
#
# @summary 5.6 Ensure access to the su command is restricted (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_5_6
class secure_linux_cis::redhat7::cis_5_6 (
  Boolean $enforced = true,
) {

  if $enforced {

    file_line { 'su':
      path => '/etc/pam.d/su',
      line => 'auth required pam_wheel.so use_uid',
    }
  }
}
