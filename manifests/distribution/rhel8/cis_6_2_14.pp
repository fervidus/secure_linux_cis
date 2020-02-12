# @api private
#
class secure_linux_cis::distribution::rhel8::cis_6_2_14 {
  include secure_linux_cis::rules::ensure_all_groups_in_etc_passwd_exist_in_etc_group
}
