#
class secure_linux_cis::distribution::ubuntu16::cis_4_1_5 {
  include secure_linux_cis::rules::ensure_events_that_modify_user_group_information_are_collected
}
