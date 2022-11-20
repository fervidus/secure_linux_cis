# @api private
#  Ensure AIDE is installed (Scored)
#
# Description:
# AIDE takes a snapshot of filesystem state including modification times, permissions, and file hashes which can then be
# used to compare against the current state of the filesystem to detect modifications to the system.
#
# @summary  Ensure AIDE is installed (Scored)
#
class secure_linux_cis::rules::ensure_sudo_is_installed {
  package { 'sudo':
    ensure   => installed,
  }
  # include sudo
}
