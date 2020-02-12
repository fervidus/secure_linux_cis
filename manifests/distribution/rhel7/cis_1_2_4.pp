# @api private
#
class secure_linux_cis::distribution::rhel7::cis_1_2_4 {
  include secure_linux_cis::rules::ensure_red_hat_subscription_manager_connection_is_configured
}
