# @api private
#
class secure_linux_cis::distribution::debian10::cis_5_2_4 {
  include secure_linux_cis::rules::ensure_ssh_protocol_is_set_to_2
}
