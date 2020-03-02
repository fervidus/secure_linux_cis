# @api private
#  Ensure Red Hat Subscription Manager connection is configured (Not Scored)
#
#
# Description:
# Systems need to be registered with the Red Hat Subscription Manager
# (RHSM) to receive patch updates. This is usually configured during initial installation.
#
# @summary  Ensure Red Hat Subscription Manager connection is configured (Not Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_red_hat_subscription_manager_connection_is_configured
class secure_linux_cis::rules::ensure_red_hat_subscription_manager_connection_is_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    if(! $facts['rhsm_identity']) {
      notify {'1_2_4 rhsm':
        message  => 'Not in compliance with CIS  (Not Scored). Ensure Red Hat Subscription Manager connection is configured',
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
