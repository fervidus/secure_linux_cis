# @param enforced Should this rule be enforced
# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_gdm_login_banner_is_configured_scored
class secure_linux_cis::rules::ensure_gdm_login_banner_is_configured_scored(
    Boolean $enforced = true,
) {
  if $enforced {
    warning('gdm banner not implemented yet')
  }
}
