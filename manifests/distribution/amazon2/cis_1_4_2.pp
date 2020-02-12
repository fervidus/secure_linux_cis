# @api private
#
class secure_linux_cis::distribution::amazon2::cis_1_4_2 {
  include secure_linux_cis::rules::ensure_authentication_required_for_single_user_mode
}
