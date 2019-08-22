# 1.2.4 Ensure Red Hat Subscription Manager connection is configured (Not Scored)
#
#
# Description:
# Systems need to be registered with the Red Hat Subscription Manager
# (RHSM) to receive patch updates. This is usually configured during initial installation.
#
# @summary 1.2.4 Ensure Red Hat Subscription Manager connection is configured (Not Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_1_2_4
class secure_linux_cis::redhat7::cis_1_2_4 (
  Boolean $enforced = true,
) {

  if $enforced {

    if(! $facts['rhsm_identity']) {
      notify {'1_2_4 rhsm':
        message  => 'Not in compliance with CIS 1.2.4 (Not Scored). Ensure Red Hat Subscription Manager connection is configured',
        loglevel => 'warning',
      }
    }
  }
}
