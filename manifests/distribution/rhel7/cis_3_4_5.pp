# @api private
#
class secure_linux_cis::distribution::rhel7::cis_3_4_5 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_hosts_deny_are_configured
}
