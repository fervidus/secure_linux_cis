#
class secure_linux_cis::centos6::cis_1_4_2 {
  include secure_linux_cis::rules::ensure_bootloader_password_is_set
}
