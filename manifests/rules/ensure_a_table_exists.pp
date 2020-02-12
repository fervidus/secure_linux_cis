# @param enforced Should this rule be enforced
# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_a_table_exists
class secure_linux_cis::rules::ensure_a_table_exists(
    Boolean $enforced = true,
) {
  if $enforced {
    notify { 'ensure_a_table_exists Still needs to be implemented.': }
  }
}
