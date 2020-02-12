# @api private
#
class secure_linux_cis::distribution::rhel8::cis_5_2_6 {
  include secure_linux_cis::rules::ensure_ssh_x11_forwarding_is_disabled
}
