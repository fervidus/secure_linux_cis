#
class secure_linux_cis::distribution::centos7::cis_1_5_3 {
  include secure_linux_cis::rules::ensure_address_space_layout_randomization_aslr_is_enabled
}
