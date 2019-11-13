#
class secure_linux_cis::cis_oracle8::cis_4_1_17 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_kernel_module_loading_and_unloading_is_collected
}
