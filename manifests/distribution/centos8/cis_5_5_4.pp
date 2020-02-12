# @api private
#
class secure_linux_cis::distribution::centos8::cis_5_5_4 {
  include secure_linux_cis::rules::ensure_default_group_for_the_root_account_is_GID_0
}
