#
class secure_linux_cis::distribution::debian9::cis_1_6_2_1 {
  include secure_linux_cis::rules::ensure_apparmor_is_not_disabled_in_bootloader_configuration
}
