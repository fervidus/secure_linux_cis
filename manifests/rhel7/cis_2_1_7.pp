#
class secure_linux_cis::rhel7::cis_2_1_7 {
  include secure_linux_cis::rules::ensure_xinetd_is_not_enabled
}
