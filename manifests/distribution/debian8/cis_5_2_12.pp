# @api private
#
class secure_linux_cis::distribution::debian8::cis_5_2_12 {
  include secure_linux_cis::rules::ensure_ssh_permituserenvironment_is_disabled
}
