#
class secure_linux_cis::cis_centos6::cis_6_2_12 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_no_users_have_netrc_files
}
