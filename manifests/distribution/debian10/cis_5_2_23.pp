# @api private
#
class secure_linux_cis::distribution::debian10::cis_5_2_23 {
  include secure_linux_cis::rules::ensure_ssh_maxsessions_is_set_to_4_or_less
}
