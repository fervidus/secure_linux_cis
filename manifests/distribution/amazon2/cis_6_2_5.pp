# @api private
#
class secure_linux_cis::distribution::amazon2::cis_6_2_5 {
  include secure_linux_cis::rules::ensure_root_is_the_only_uid_0_account
}
