#
class secure_linux_cis::cis_debian8::cis_2_1_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_chargen_services_are_not_enabled
}
