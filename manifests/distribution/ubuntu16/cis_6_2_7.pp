# @api private
#
class secure_linux_cis::distribution::ubuntu16::cis_6_2_7 {
  include secure_linux_cis::rules::ensure_all_users_home_directories_exist
}
