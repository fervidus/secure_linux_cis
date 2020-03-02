# @api private
#
class secure_linux_cis::distribution::aliyun2::cis_1_6_1_5 {
  include secure_linux_cis::rules::ensure_the_mcs_translation_service_mcstrans_is_not_installed
}
