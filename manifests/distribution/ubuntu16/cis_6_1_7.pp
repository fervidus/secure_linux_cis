#
class secure_linux_cis::distribution::ubuntu16::cis_6_1_7 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_shadow_are_configured
}
