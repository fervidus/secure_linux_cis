#
class secure_linux_cis::distribution::rhel7::cis_2_1_1 {
  include secure_linux_cis::rules::ensure_chargen_services_are_not_enabled
}
