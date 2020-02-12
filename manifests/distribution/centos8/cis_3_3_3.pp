# @api private
#
class secure_linux_cis::distribution::centos8::cis_3_3_3 {
  include secure_linux_cis::rules::ensure_RDS_is_disabled
}
