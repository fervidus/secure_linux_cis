# @api private
#
class secure_linux_cis::distribution::ubuntu16::cis_5_2_9 {
  include secure_linux_cis::rules::ensure_ssh_permitemptypasswords_is_disabled
}
