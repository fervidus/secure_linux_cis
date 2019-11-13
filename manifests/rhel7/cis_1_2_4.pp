#
class secure_linux_cis::cis_rhel7::cis_1_2_4 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_red_hat_subscription_manager_connection_is_configured
}
