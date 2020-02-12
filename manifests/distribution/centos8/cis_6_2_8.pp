# @api private
#
class secure_linux_cis::distribution::centos8::cis_6_2_8 {
  include secure_linux_cis::rules::ensure_users_own_their_home_directories
}
