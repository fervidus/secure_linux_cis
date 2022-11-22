# @api private
#
# @summary Ensure ufw default deny firewall policy 
#
class secure_linux_cis::rules::ensure_ufw_default_deny_firewall_policy {
  include secure_linux_cis::rules::ensure_ufw_is_installed
}
