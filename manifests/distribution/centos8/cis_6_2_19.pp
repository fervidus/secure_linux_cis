#
class secure_linux_cis::distribution::centos8::cis_6_2_19 {
  include secure_linux_cis::rules::ensure_shadow_group_is_empty
}
