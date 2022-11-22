# @api private
#
# @summary Ensure sudo is installed 
#
class secure_linux_cis::rules::ensure_sudo_is_installed {
  package { 'sudo':
    ensure   => installed,
  }
  # include sudo
}
