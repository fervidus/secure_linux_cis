#
class secure_linux_cis::amazon2::cis_5_2_2 {
  include secure_linux_cis::rules::ensure_permissions_on_ssh_private_host_key_files_are_configured
}
