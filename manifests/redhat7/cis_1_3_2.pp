# 1.3.2 Ensure filesystem integrity is regularly checked (Scored)
#
#
# Description:
# Periodic checking of the filesystem integrity is needed to detect changes to the filesystem.
#
# @summary 1.3.2 Ensure filesystem integrity is regularly checked (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_3_2
class secure_linux_cis::redhat7::cis_1_3_2 (
  Boolean $enforced = true,
) {

  if $enforced {

    cron {'cron_aide':
      command => '/usr/sbin/aide --check',
      user    => 'root',
      hour    => 5,
      minute  => 0,
    }
  }
}
