#
class secure_linux_cis::rhel8::cis_1_7_1_4 {
  include secure_linux_cis::rules::ensure_the_selinux_state_is_enforcing
}