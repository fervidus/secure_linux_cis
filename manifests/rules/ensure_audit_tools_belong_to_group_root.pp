# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_audit_tools_belong_to_group_root
class secure_linux_cis::rules::ensure_audit_tools_belong_to_group_root {
  include secure_linux_cis::rules::ensure_audit_tools_are_owned_by_root
}
