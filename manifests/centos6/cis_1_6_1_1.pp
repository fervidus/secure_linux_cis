#
class secure_linux_cis::centos6::cis_1_6_1_1 {
  include secure_linux_cis::rules::ensure_selinux_is_not_disabled_in_bootloader_configuration
}
