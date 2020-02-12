# @api private
#
class secure_linux_cis::distribution::ubuntu18::cis_2_2_2 {
  include secure_linux_cis::rules::ensure_x_window_system_is_not_installed
}
