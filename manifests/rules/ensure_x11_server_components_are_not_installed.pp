# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_x11_server_components_are_not_installed {
  package { 'xorg-x11-server*':
    ensure => absent,
  }
}
