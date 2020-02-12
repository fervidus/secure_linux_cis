# @api private
#
class secure_linux_cis::distribution::centos7::cis_5_2_2 {
  include secure_linux_cis::rules::ensure_ssh_protocol_is_set_to_2
}
