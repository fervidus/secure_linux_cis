# @api private
#
class secure_linux_cis::distribution::centos8::cis_2_2_2 {
  include secure_linux_cis::rules::ensure_X_Window_System_is_not_installed
}
