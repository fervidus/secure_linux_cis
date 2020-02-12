# @api private
#
class secure_linux_cis::distribution::amazon1::cis_5_4_3 {
  include secure_linux_cis::rules::ensure_default_group_for_the_root_account_is_gid_0
}
