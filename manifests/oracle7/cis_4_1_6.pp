#
class secure_linux_cis::cis_oracle7::cis_4_1_6 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_events_that_modify_the_system_s_network_environment_are_collected
}
