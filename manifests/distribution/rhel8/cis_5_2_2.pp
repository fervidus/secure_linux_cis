# @api private
#
class secure_linux_cis::distribution::rhel8::cis_5_2_2 {
  include secure_linux_cis::rules::ensure_ssh_access_is_limited
}
