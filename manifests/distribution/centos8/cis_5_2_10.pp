# @api private
#
class secure_linux_cis::distribution::centos8::cis_5_2_10 {
  include secure_linux_cis::rules::ensure_SSH_root_login_is_disabled
}
