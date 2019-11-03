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
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_x_window_system_is_not_installed

class secure_linux_cis::rules::ensure_x_window_system_is_not_installed {

  if !empty($facts['xorg_x11_packages']) {
    package { $facts['xorg_x11_packages']:
      ensure => purged,
    }
  }
}
