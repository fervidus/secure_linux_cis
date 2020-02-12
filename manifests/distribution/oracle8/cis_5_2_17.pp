# @api private
#
class secure_linux_cis::distribution::oracle8::cis_5_2_17 {
  include secure_linux_cis::rules::ensure_ssh_allowtcpforwarding_is_disabled
}
