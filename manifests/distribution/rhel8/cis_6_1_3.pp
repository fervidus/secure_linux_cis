#
class secure_linux_cis::distribution::rhel8::cis_6_1_3 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_shadow_are_configured
}
