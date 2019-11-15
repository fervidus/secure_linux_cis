#
class secure_linux_cis::ubuntu18::cis_2_2_1_3 {
  include secure_linux_cis::rules::ensure_chrony_is_configured
}
