# @api private
#
# @summary Disable Automounting 
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
