# @api private
#
class secure_linux_cis::distribution::debian10::cis_2_2_12 {
  include secure_linux_cis::rules::ensure_samba_is_not_enabled
}
