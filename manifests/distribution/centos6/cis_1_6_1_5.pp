#
class secure_linux_cis::distribution::centos6::cis_1_6_1_5 {
  include secure_linux_cis::rules::ensure_the_mcs_translation_service_mcstrans_is_not_installed
}
