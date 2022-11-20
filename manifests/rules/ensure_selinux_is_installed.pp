# @api private
#  Ensure SELinux is installed (Scored)
#
# Description:
# SELinux provides Mandatory Access Controls.
#
# @summary  Ensure SELinux is installed (Scored)
#
class secure_linux_cis::rules::ensure_selinux_is_installed {
  package { 'libselinux':
    ensure   => present,
  }
}
