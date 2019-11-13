#
class secure_linux_cis::cis_oracle8::cis_1_1_21 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_sticky_bit_is_set_on_all_world_writable_directories
}
