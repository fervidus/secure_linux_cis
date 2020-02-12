# @api private
#
class secure_linux_cis::distribution::rhel6::cis_2_3_1 {
  include secure_linux_cis::rules::ensure_nis_client_is_not_installed
}
