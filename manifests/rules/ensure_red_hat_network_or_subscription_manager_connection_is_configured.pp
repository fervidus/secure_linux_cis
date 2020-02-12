# @param enforced Should this rule be enforced
# @api private
# @example
#   include secure_linux_cis::ensure_all_apparmor_profiles_are_enforcing
class secure_linux_cis::rules::ensure_red_hat_network_or_subscription_manager_connection_is_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    warning('ensure_all_apparmor_profiles_are_enforcing needs to be completed.')
  }
}
