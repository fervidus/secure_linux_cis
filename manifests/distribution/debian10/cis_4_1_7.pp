# @api private
#
class secure_linux_cis::distribution::debian10::cis_4_1_7 {
  include secure_linux_cis::rules::ensure_login_and_logout_events_are_collected
}
