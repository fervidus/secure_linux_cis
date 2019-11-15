#
class secure_linux_cis::ubuntu18::cis_6_2_14 {
  include secure_linux_cis::rules::ensure_no_users_have_rhosts_files
}
