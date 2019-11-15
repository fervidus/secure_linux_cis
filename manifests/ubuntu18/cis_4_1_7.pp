#
class secure_linux_cis::ubuntu18::cis_4_1_7 {
  include secure_linux_cis::rules::ensure_events_that_modify_the_system_s_mandatory_access_controls_are_collected
}
