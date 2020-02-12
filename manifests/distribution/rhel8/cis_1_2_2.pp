# @api private
#
class secure_linux_cis::distribution::rhel8::cis_1_2_2 {
  include secure_linux_cis::rules::disable_the_rhnsd_daemon
}
