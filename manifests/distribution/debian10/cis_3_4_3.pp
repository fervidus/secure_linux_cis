# @api private
#
class secure_linux_cis::distribution::debian10::cis_3_4_3 {
  include secure_linux_cis::rules::ensure_rds_is_disabled
}
