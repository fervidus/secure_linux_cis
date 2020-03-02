# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::reboot
class secure_linux_cis::reboot {
  if $::secure_linux_cis::auto_restart {
    reboot { 'after_run':
      apply    => 'finished',
      schedule => 'harden_schedule',
      timeout  => 60,
    }
  }
}
