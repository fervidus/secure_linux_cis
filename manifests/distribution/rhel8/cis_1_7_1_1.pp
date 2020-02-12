# @api private
#
class secure_linux_cis::distribution::rhel8::cis_1_7_1_1 {
  include secure_linux_cis::rules::ensure_selinux_is_installed
}
