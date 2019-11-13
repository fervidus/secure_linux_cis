#
class secure_linux_cis::cis_oracle8::cis_4_1_16 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_system_administrator_actions_sudolog_are_collected
}
