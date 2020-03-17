# @api private
#
class secure_linux_cis::distribution::debian10::cis_1_7_1_4 {
  include secure_linux_cis::rules::ensure_all_apparmor_profiles_are_enforcing
}
