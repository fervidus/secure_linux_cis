# 2.2.2 Ensure X Window System is not installed (Scored)
#
# Description:
# The X Window System provides a Graphical User Interface (GUI) where users can have multiple windows
# in which to run programs and various add on. The X Windows system is typically used on workstations where users login,
# but not on servers where users typically do not login.
#
# Rationale:
# Unless your organization specifically requires graphical login access via X Windows, remove it to reduce the potential attack surface.
#
# @summary 2.2.2 Ensure X Window System is not installed (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_2_2_2
class secure_linux_cis::redhat7::cis_2_2_2 (
  Boolean $enforced = true,
) {

  if $enforced and $facts['xorg_x11_packages'] != [] {

    package { $facts['xorg_x11_packages']:
      ensure => purged,
    }
  }
}
