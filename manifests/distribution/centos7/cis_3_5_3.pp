# @api private
#
class secure_linux_cis::distribution::centos7::cis_3_5_3 {
  include secure_linux_cis::rules::ensure_rds_is_disabled
}
