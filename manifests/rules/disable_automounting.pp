# @api private
#
# 2 Disable Automounting (Scored)
#
# Description:
# autofs allows automatic mounting of devices, typically including CD/DVDs and USB drives.
#
# @summary 2 Disable Automounting (Scored)
#
class secure_linux_cis::rules::disable_automounting {
  package { 'autofs':
    ensure => absent,
  }

  service { 'autofs':
    ensure => stopped,
    enable => false,
  }
}
