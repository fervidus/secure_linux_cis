# @api private
#  Ensure X Window System is not installed (Scored)
#
# Description:
# The X Window System provides a Graphical User Interface (GUI) where users can have multiple windows
# in which to run programs and various add on. The X Windows system is typically used on workstations where users login,
# but not on servers where users typically do not login.
#
# Rationale:
# Unless your organization specifically requires graphical login access via X Windows, remove it to reduce the potential attack surface.
#
# @summary  Ensure X Window System is not installed (Scored)
#
# @param enforced
#   Should this rule be enforced - defaults to false - test before enabling as some xorg packages may be required as dependancies. 
#   See exclude param if you need to exclude packages from removal
#
# @param exclude 
#   Optional Array of xorg packages to NOT remove. This may want to be used if specific xorg packages are required as dependancies. 
#   Must match exactly with the package name obtained through the xorg_x11_packages fact.
#
# @example
#   include secure_linux_cis::ensure_x_window_system_is_not_installed
#
# @example Using hiera
# secure_linux_cis::rules::ensure_x_window_system_is_not_installed::enforced:: true
# secure_linux_cis::rules::ensure_x_window_system_is_not_installed::exclude:
#   - 'xorg-x11-font-utils'
#   - 'xorg-x11-fonts-Type1'

class secure_linux_cis::rules::ensure_x_window_system_is_not_installed(
    Boolean $enforced = false,
    Optional[Array] $exclude = undef,
) {
  if $enforced {
    unless $facts['xorg_x11_packages'].empty {
      $facts['xorg_x11_packages'].each |String $package| {
        if ! ($package in $exclude) {
          package { $package:
          ensure   => purged,
          schedule => 'harden_schedule',
          }
        }
      }
    }
  }
}
