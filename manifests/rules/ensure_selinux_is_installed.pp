# @api private
#
# @summary Ensure SELinux is installed 
#
class secure_linux_cis::rules::ensure_selinux_is_installed {
  package { 'libselinux':
    ensure   => present,
  }
}
