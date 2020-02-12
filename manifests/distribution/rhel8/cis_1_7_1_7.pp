# @api private
#
class secure_linux_cis::distribution::rhel8::cis_1_7_1_7 {
  include secure_linux_cis::rules::ensure_the_mcs_translation_service_mcstrans_is_not_installed
}
