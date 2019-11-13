#
class secure_linux_cis::cis_rhel6::cis_4_1_15 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_changes_to_system_administration_scope_sudoers_is_collected
}
