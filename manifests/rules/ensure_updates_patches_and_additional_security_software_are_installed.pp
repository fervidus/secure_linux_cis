#  Ensure updates, patches, and additional security software are installed (Scored)
#
#
# Description:
# Periodically patches are released for included software either due to security flaws or to include additional functionality.
#
# @summary  Ensure updates, patches, and additional security software are installed (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_updates_patches_and_additional_security_software_are_installed
class secure_linux_cis::rules::ensure_updates_patches_and_additional_security_software_are_installed (
  Boolean $enforced = true,
) {

  case $facts['os']['family'] {
    'RedHat': {
      $command = 'yum check-update --security'
    }
    'Debian': {
      $command = 'apt-get -s upgrade'
    }
    default: {
    }
  }

  if $enforced {

    cron::monthly { 'security-update':
      ensure      => present,
      environment =>  [ 'MAILTO=root', 'PATH="/usr/bin:/bin"', ],
      command     => $command,
    }

  }
}
