# @api private
#
class secure_linux_cis::distribution::centos8::cis_5_2_8 {
  include secure_linux_cis::rules::ensure_SSH_IgnoreRhosts_is_enabled
}
