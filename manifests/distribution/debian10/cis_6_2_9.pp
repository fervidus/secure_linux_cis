# @api private
#
class secure_linux_cis::distribution::debian10::cis_6_2_9 {
  include secure_linux_cis::rules::ensure_users_own_their_home_directories
}
