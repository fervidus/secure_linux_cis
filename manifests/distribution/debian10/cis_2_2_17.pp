# @api private
#
class secure_linux_cis::distribution::debian10::cis_2_2_17 {
  include secure_linux_cis::rules::ensure_nis_server_is_not_enabled
}
