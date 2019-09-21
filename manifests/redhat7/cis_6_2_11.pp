# 6.2.11 Ensure no users have .forward files (Scored)
#
#
# Description:
# The .forward file specifies an email address to forward the user's mail to.
#
# @summary 6.2.11 Ensure no users have .forward files (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_11
class secure_linux_cis::redhat7::cis_6_2_11 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/usr/share/application/cis_scripts/forward.sh':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0700',
      content => file('secure_linux_cis/forward.sh'),
    }

    if !($facts['forward_files'].empty) {

      notify { 'ff':
        message  => 'Not in compliance with CIS 6.2.11 (Scored). There are .forward files on the system. Check the forward_files fact for details',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
