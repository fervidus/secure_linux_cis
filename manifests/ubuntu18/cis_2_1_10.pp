#
class secure_linux_cis::ubuntu18::cis_2_1_10 {
  include secure_linux_cis::rules::ensure_xinetd_is_not_enabled
}
