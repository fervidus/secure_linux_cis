# @api private
#
# @summary Ensure systemd-journal-remote is installed 
#
class secure_linux_cis::rules::ensure_systemd_journal_remote_is_installed {
  package { 'systemd-journal-remote':
    ensure   => installed,
  }
  # include sudo
}
