#
class secure_linux_cis::cis_centos6::cis_1_4_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_bootloader_password_is_set
}
