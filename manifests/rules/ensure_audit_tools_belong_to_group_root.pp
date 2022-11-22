# @api private
#
# @summary Ensure audit tools belong to group root 
#
class secure_linux_cis::rules::ensure_audit_tools_belong_to_group_root {
  include secure_linux_cis::rules::ensure_audit_tools_are_owned_by_root
}
