# @api private
#
class secure_linux_cis::distribution::amazon1::cis_5_2_8 {
  include secure_linux_cis::rules::ensure_ssh_root_login_is_disabled
}
