# @api private
#
# @summary Ensure journald is not configured to recieve logs from a remote client 
#
class secure_linux_cis::rules::ensure_journald_is_not_configured_to_recieve_logs_from_a_remote_client {
  service { 'systemd-journal-remote':
    ensure => stopped,
    # enable => 'mask',
    enable => false,
  }
}
