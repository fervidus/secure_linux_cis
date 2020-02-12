# @api private
#
class secure_linux_cis::distribution::centos8::cis_1_7_1_1 {
  include secure_linux_cis::rules::ensure_SELinux_is_installed
}
