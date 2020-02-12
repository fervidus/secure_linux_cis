# @api private
#
class secure_linux_cis::distribution::rhel8::cis_6_2_20 {
  include secure_linux_cis::rules::ensure_all_users_home_directories_exist
}
