#
class secure_linux_cis::distribution::rhel7::cis_4_1_15 {
  include secure_linux_cis::rules::ensure_changes_to_system_administration_scope_sudoers_is_collected
}
