#
class secure_linux_cis::distribution::rhel6::cis_6_2_14 {
  include secure_linux_cis::rules::ensure_no_users_have_rhosts_files
}
