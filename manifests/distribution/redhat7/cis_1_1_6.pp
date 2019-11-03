# 1.1.6 Ensure separate partition exists for /var (Scored)
#
#
# Description:
# The /var directory is used by daemons and other system services to temporarily store dynamic data. Some directories created by
# these processes may be world-writable.
#
# @summary 1.1.6 Ensure separate partition exists for /var (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::distribution::redhat7::cis_1_1_6
class secure_linux_cis::distribution::redhat7::cis_1_1_6 (
  Boolean $enforced = true,
) {
  if $enforced {

    if ! $facts['mountpoints']['/var'] {
      notify { 'vp':
        message  => 'Not in compliance with CIS 1.1.6 (Scored). A seperate partition does not exist for /var',
        loglevel => 'warning',
      }
    }

  }
}
