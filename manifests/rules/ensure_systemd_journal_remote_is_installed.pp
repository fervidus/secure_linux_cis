# @api private
#  Ensure AIDE is installed (Scored)
#
#
# Description:
# AIDE takes a snapshot of filesystem state including modification times, permissions, and file hashes which can then be
# used to compare against the current state of the filesystem to detect modifications to the system.
#
# @summary  Ensure AIDE is installed (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_sudo_is_installed
class secure_linux_cis::rules::ensure_systemd_journal_remote_is_installed {
  package { 'systemd-journal-remote':
    ensure   => installed,
  }
  # include sudo
}
