# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_ftp_client_is_not_installed
class secure_linux_cis::rules::ensure_ftp_client_is_not_installed {
  include secure_linux_cis::rules::ensure_ftp_server_is_not_installed
}
