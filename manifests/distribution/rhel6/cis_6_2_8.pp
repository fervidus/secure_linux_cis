# @api private
#
class secure_linux_cis::distribution::rhel6::cis_6_2_8 {
  include secure_linux_cis::rules::ensure_users_home_directories_permissions_are_750_or_more_restrictive
}
