# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::reboot
class secure_linux_cis::reboot {
  reboot { 'after_run':
    apply   => 'finished',
    timeout => 60,
  }
}
