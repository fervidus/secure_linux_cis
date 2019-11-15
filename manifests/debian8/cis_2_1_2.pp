#
class secure_linux_cis::debian8::cis_2_1_2 {
  include secure_linux_cis::rules::ensure_inetd_is_not_installed
}
