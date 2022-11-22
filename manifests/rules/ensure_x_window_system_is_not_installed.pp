# @api private
#
# @summary Ensure X Window System is not installed 
#
class secure_linux_cis::rules::ensure_x_window_system_is_not_installed (
  Boolean $enforced = false,
  Optional[Array] $exclude = $secure_linux_cis::exclude_x_window_packages,
) {
  unless $facts['xorg_x11_packages'].empty {
    $facts['xorg_x11_packages'].each |String $package| {
      if ! ($package in $exclude) {
        package { $package:
          ensure   => absent,
        }
      }
    }
  }
}
