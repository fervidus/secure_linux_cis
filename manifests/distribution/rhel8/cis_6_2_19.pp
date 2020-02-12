# @api private
#
class secure_linux_cis::distribution::rhel8::cis_6_2_19 {
  include secure_linux_cis::rules::ensure_shadow_group_is_empty
}
