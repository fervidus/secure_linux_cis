#
class secure_linux_cis::distribution::centos6::cis_2_2_1_3 {
  include secure_linux_cis::rules::ensure_chrony_is_configured
}
