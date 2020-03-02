# @api private
#
class secure_linux_cis::distribution::aliyun2::cis_2_2_1 {
  include secure_linux_cis::rules::ensure_nis_client_is_not_installed
}
