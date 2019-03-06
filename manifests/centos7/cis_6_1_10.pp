# 6.1.10 Ensure no world writable files exist (Scored)
#
# Description:
# Unix-based systems support variable settings to control access to files. World writable files are the least secure. See the chmod(2)
# man page for more information.
#
# @summary 6.1.10 Ensure no world writable files exist (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_1_10
class secure_linux_cis::centos7::cis_6_1_10 (
  Boolean $enforced = true,
) {

  if $enforced {

    if $facts['world_writable_redhat'] {

      notify { 'wwrh':
        message  => '[6.1.10] You have one or more world writable files. Check the world_writable fact for details.',
        loglevel => 'warning',
      }
    }
  }
}
