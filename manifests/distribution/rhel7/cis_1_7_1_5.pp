# @api private
#
class secure_linux_cis::distribution::rhel7::cis_1_7_1_5 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_issue_are_configured
}
