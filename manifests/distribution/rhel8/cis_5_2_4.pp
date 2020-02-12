# @api private
#
class secure_linux_cis::distribution::rhel8::cis_5_2_4 {
  include secure_linux_cis::rules::ensure_permissions_on_ssh_public_host_key_files_are_configured
}
