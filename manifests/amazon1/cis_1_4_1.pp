#
class secure_linux_cis::cis_amazon1::cis_1_4_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_permissions_on_bootloader_config_are_configured
}
