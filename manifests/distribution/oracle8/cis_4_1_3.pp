# @api private
#
class secure_linux_cis::distribution::oracle8::cis_4_1_3 {
  include secure_linux_cis::rules::ensure_changes_to_system_administration_scope_sudoers_is_collected
}
