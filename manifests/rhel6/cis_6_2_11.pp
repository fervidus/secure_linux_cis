#
class secure_linux_cis::cis_rhel6::cis_6_2_11 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_no_users_have_forward_files
}
