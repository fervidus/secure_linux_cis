# @api private
#
class secure_linux_cis::distribution::rhel6::cis_1_2_4 {
  include secure_linux_cis::rules::ensure_red_hat_network_or_subscription_manager_connection_is_configured
}
