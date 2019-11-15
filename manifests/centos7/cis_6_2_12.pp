#
class secure_linux_cis::centos7::cis_6_2_12 {
  include secure_linux_cis::rules::ensure_no_users_have_netrc_files
}
