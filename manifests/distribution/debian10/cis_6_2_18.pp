# @api private
#
class secure_linux_cis::distribution::debian10::cis_6_2_18 {
  include secure_linux_cis::rules::ensure_no_duplicate_user_names_exist
}
