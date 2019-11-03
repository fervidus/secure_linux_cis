# 1.1.11 Ensure separate partition exists for /var/log (Scored)
#
#
# Description:
# The /var/log directory is used by system services to store log data
#
# @summary 1.1.11 Ensure separate partition exists for /var/log (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::distribution::redhat7::cis_1_1_11
class secure_linux_cis::distribution::redhat7::cis_1_1_11 (
  Boolean $enforced = true,
) {
  if $enforced {

    if ! $facts['mountpoints']['/var/log'] {
      notify { 'vlp':
        message  => 'Not in compliance with CIS 1.1.11 (Scored). A separate partition does not exist for /var/log',
        loglevel => 'warning',
      }
    }

  }
}
