#
class secure_linux_cis::cis_oracle6::cis_1_6_1_3 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_selinux_policy_is_configured
}
