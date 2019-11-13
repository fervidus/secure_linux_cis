#
class secure_linux_cis::cis_rhel8::cis_1_2_5 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::disable_the_rhnsd_daemon
}
