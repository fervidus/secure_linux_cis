# @api private
#
class secure_linux_cis::distribution::debian10::cis_6_2_12 {
  include secure_linux_cis::rules::ensure_no_users_have_netrc_files
}
