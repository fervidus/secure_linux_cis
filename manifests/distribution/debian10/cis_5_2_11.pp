# @api private
#
class secure_linux_cis::distribution::debian10::cis_5_2_11 {
  include secure_linux_cis::rules::ensure_ssh_permitemptypasswords_is_disabled
}
