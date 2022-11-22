# @api private
#
# @summary Ensure NIS Client is not installed 
#
class secure_linux_cis::rules::ensure_nis_client_is_not_installed {
  include secure_linux_cis::rules::ensure_nis_server_is_not_installed
}
