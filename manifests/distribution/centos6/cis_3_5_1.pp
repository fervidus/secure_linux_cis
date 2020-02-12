# @api private
#
class secure_linux_cis::distribution::centos6::cis_3_5_1 {
  include secure_linux_cis::rules::ensure_dccp_is_disabled
}
