#
class secure_linux_cis::cis_debian8::cis_1_5_3 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_address_space_layout_randomization_aslr_is_enabled
}
