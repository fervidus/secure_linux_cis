# @api private
#
class secure_linux_cis::distribution::centos8::cis_2_3_1 {
  include secure_linux_cis::rules::ensure_NIS_Client_is_not_installed
}
