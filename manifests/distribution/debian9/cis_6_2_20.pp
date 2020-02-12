# @api private
#
class secure_linux_cis::distribution::debian9::cis_6_2_20 {
  include secure_linux_cis::rules::ensure_shadow_group_is_empty
}
