# @api private
#
class secure_linux_cis::distribution::ubuntu16::cis_6_2_13 {
  include secure_linux_cis::rules::ensure_users_netrc_files_are_not_group_or_world_accessible
}
