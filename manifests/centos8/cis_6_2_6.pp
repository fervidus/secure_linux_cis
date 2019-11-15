#
class secure_linux_cis::centos8::cis_6_2_6 {
  include secure_linux_cis::rules::ensure_root_is_the_only_UID_0_account
}
