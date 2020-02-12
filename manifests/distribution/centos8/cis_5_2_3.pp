# @api private
#
class secure_linux_cis::distribution::centos8::cis_5_2_3 {
  include secure_linux_cis::rules::ensure_permissions_on_SSH_private_host_key_files_are_configured
}
