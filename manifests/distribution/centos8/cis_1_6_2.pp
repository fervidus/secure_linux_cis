#
class secure_linux_cis::distribution::centos8::cis_1_6_2 {
  include secure_linux_cis::rules::ensure_address_space_layout_randomization_ASLR_is_enabled
}
