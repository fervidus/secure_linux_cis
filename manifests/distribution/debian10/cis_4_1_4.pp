# @api private
#
class secure_linux_cis::distribution::debian10::cis_4_1_4 {
  include secure_linux_cis::rules::ensure_events_that_modify_user_group_information_are_collected
}
