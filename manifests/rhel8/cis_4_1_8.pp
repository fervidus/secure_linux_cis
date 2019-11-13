#
class secure_linux_cis::cis_rhel8::cis_4_1_8 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_login_and_logout_events_are_collected
}
