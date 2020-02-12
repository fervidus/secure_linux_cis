# @api private
#
class secure_linux_cis::distribution::rhel6::cis_6_2_7 {
  include secure_linux_cis::rules::ensure_all_users_home_directories_exist
}
