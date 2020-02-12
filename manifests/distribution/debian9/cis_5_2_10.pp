# @api private
#
class secure_linux_cis::distribution::debian9::cis_5_2_10 {
  include secure_linux_cis::rules::ensure_ssh_root_login_is_disabled
}
