# @api private
#
class secure_linux_cis::distribution::amazon2::cis_3_3_5 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_hosts_deny_are_configured
}
