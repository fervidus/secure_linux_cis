#
class secure_linux_cis::distribution::rhel8::cis_1_7_1_2 {
  include secure_linux_cis::rules::ensure_selinux_is_not_disabled_in_bootloader_configuration
}
