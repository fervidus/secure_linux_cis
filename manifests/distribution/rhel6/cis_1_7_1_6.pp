# @api private
#
class secure_linux_cis::distribution::rhel6::cis_1_7_1_6 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_issue_net_are_configured
}
