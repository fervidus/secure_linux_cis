# @param enforced Should this rule be enforced
# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_system_accounts_are_secured
class secure_linux_cis::rules::ensure_system_accounts_are_secured (
  Boolean $enforced = true,
) {
  if $enforced {
    unless $facts['insecure_system_accounts'] {
      warning('Insecure system accounts are present.')
    }
  }
}
