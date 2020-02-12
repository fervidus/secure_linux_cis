# @api private
#
class secure_linux_cis::distribution::oracle8::cis_4_1_6 {
  include secure_linux_cis::rules::ensure_events_that_modify_date_and_time_information_are_collected
}
