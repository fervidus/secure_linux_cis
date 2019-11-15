#
class secure_linux_cis::ubuntu16::cis_4_1_4 {
  include secure_linux_cis::rules::ensure_events_that_modify_date_and_time_information_are_collected
}
