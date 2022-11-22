# @api private
#
# @summary Ensure FTP client is not installed 
#
class secure_linux_cis::rules::ensure_ftp_client_is_not_installed {
  include secure_linux_cis::rules::ensure_ftp_server_is_not_installed
}
