# @api private
#
# @summary Ensure journald is not configured to receive logs from a remote client 
#
class secure_linux_cis::rules::ensure_journald_is_not_configured_to_receive_logs_from_a_remote_client {
  include secure_linux_cis::rules::ensure_journald_is_not_configured_to_recieve_logs_from_a_remote_client
}
