#
class secure_linux_cis::rhel6::cis_5_2_14 {
  include secure_linux_cis::rules::ensure_ssh_access_is_limited
}