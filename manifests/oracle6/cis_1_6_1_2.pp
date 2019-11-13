#
class secure_linux_cis::cis_oracle6::cis_1_6_1_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_the_selinux_state_is_enforcing
}
