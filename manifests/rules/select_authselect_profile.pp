# @param enforced Should this rule be enforced
# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::select_authselect_profile
class secure_linux_cis::rules::select_authselect_profile (
  Boolean $enforced = true,
) {
  #if $enforced {
  #  # TODO: will require a custom fact for AD or Red Hat Enterprise Linux Identity Management
  #}
}
