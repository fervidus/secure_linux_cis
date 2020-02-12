# @api private
#
class secure_linux_cis::distribution::centos8::cis_5_2_6 {
  include secure_linux_cis::rules::ensure_SSH_X11_forwarding_is_disabled
}
