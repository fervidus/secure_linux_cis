#  Ensure SELinux is installed (Scored)
#
#
# Description:
# SELinux provides Mandatory Access Controls.
#
# @summary  Ensure SELinux is installed (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_selinux_is_installed

class secure_linux_cis::rules::ensure_selinux_is_installed {

    package { 'libselinux':
      ensure => present,
    }

  }
