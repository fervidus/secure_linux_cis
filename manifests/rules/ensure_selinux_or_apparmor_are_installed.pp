# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_selinux_or_apparmor_are_installed
class secure_linux_cis::rules::ensure_selinux_or_apparmor_are_installed {
  case $::secure_linux_cis::mac {
    'selinux': {
      $packages = ['selinux-basics', 'selinux-policy-default']
    }
    'apparmor': {
      $packages = ['apparmor', 'apparmor-utils']
    }
    default: {
    }
  }

  package { $packages:
    ensure => installed,
  }
}
