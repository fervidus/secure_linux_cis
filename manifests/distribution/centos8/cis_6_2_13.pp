#
class secure_linux_cis::distribution::centos8::cis_6_2_13 {
  include secure_linux_cis::rules::ensure_no_users_have_rhosts_files
}
