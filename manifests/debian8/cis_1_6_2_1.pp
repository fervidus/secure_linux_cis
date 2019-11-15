#
class secure_linux_cis::debian8::cis_1_6_2_1 {
  include secure_linux_cis::rules::ensure_apparmor_is_enabled_in_the_bootloader_configuration
}
