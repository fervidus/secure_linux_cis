# @api private
#
class secure_linux_cis::distribution::debian10::cis_6_2_3 {
  include secure_linux_cis::rules::ensure_all_users_home_directories_exist
}
