# 1.8 Ensure updates, patches, and additional security software are installed (Scored)
#
#
# Description:
# Periodically patches are released for included software either due to security flaws or to include additional functionality.
#
# @summary 1.8 Ensure updates, patches, and additional security software are installed (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_8
class secure_linux_cis::redhat7::cis_1_8 (
  Boolean $enforced = true,
) {

  if $enforced {

    cron { 'security-update':
      ensure   => present,
      command  => 'yum check-update --security',
      monthday => '1',
    }
  }
}
