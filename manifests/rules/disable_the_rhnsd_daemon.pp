# @api private
#
# @summary Disable the rhnsd Daemon 
#
class secure_linux_cis::rules::disable_the_rhnsd_daemon {
  service { 'rhnsd':
    ensure => stopped,
    enable => false,
  }
}
