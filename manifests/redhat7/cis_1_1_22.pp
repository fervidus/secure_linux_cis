# 1.1.22 Disable Automounting (Scored)
#
#
# Description:
# autofs allows automatic mounting of devices, typically including CD/DVDs and USB drives.
#
# @summary 1.1.22 Disable Automounting (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_22
class secure_linux_cis::redhat7::cis_1_1_22 (
  Boolean $enforced = true,
  ) {
    if $enforced {

      if $facts['automounting'] == 'enabled' {

        exec {'disable_automount':
          command => 'systemctl disable autofs',
          path    => '/bin/',
        }
      }
    }
}
