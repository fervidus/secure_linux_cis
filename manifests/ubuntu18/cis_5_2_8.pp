#
class secure_linux_cis::ubuntu18::cis_5_2_8 {
  include secure_linux_cis::rules::ensure_ssh_root_login_is_disabled
}
