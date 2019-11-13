#
class secure_linux_cis::cis_rhel7::cis_4_1_7 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_events_that_modify_the_system_s_mandatory_access_controls_are_collected
}
