# @api private
#
class secure_linux_cis::distribution::centos8::cis_1_7_1_7 {
  include secure_linux_cis::rules::ensure_the_MCS_Translation_Service_mcstrans_is_not_installed
}
