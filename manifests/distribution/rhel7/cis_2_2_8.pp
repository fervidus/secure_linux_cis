# @api private
#
class secure_linux_cis::distribution::rhel7::cis_2_2_8 {
  include secure_linux_cis::rules::ensure_dns_server_is_not_enabled
}
