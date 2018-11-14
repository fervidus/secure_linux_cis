# 1.6.1.6 Ensure no unconfined daemons exist (Scored)
#
#
# Description:
# Daemons that are not defined in SELinux policy will inherit the security context of their parent process.
#
# @summary 1.6.1.6 Ensure no unconfined daemons exist (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_6_1_6
class secure_linux_cis::redhat7::cis_1_6_1_6 (
  Boolean $enforced = true,
) {

  if $enforced {

    if $facts['unconf_daemons'] {

      notify { 'ud':
        message  => 'Not in compliance with CIS 1.6.1.6 (Scored). There are unconfined daemons running on the system',
        loglevel => 'warning',
      }
    }
  }
}
