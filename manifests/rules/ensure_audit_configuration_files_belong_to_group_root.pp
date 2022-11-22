# @api private
#
# @summary Ensure audit configuration files belong to group root 
#
class secure_linux_cis::rules::ensure_audit_configuration_files_belong_to_group_root {
  include secure_linux_cis::rules::ensure_audit_configuration_files_are_owned_by_root
}
