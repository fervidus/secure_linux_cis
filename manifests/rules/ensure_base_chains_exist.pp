# @param enforced Should this rule be enforced
# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_base_chains_exist
class secure_linux_cis::rules::ensure_base_chains_exist(
    Boolean $enforced = true,
) {
  if $enforced {
    notify { 'ensure_base_chains_exist Still needs to be implemented.': }
  }
}
