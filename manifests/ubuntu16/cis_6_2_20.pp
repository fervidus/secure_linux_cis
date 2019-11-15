#
class secure_linux_cis::ubuntu16::cis_6_2_20 {
  include secure_linux_cis::rules::ensure_shadow_group_is_empty
}
