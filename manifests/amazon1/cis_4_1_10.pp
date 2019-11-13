#
class secure_linux_cis::cis_amazon1::cis_4_1_10 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_discretionary_access_control_permission_modification_events_are_collected
}
