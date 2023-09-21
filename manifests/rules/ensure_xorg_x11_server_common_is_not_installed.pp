# @api private
#
# @summary Ensure xorg-x11-server-common is not installed
#
class secure_linux_cis::rules::ensure_xorg_x11_server_common_is_not_installed {
  package { 'xorg-x11-server-common':
    ensure   => absent,
  }
}

