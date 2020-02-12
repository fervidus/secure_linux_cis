# @api private
#
class secure_linux_cis::distribution::centos8::cis_6_2_12 {
  include secure_linux_cis::rules::ensure_users_netrc_Files_are_not_group_or_world_accessible
}
