#
class secure_linux_cis::cis_oracle6::cis_1_6_1_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_selinux_is_not_disabled_in_bootloader_configuration
}
