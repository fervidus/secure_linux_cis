#
class secure_linux_cis::distribution::centos8::cis_5_2_4 {
  include secure_linux_cis::rules::ensure_permissions_on_SSH_public_host_key_files_are_configured
}
