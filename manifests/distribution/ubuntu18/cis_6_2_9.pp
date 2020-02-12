# @api private
#
class secure_linux_cis::distribution::ubuntu18::cis_6_2_9 {
  include secure_linux_cis::rules::ensure_users_own_their_home_directories
}
