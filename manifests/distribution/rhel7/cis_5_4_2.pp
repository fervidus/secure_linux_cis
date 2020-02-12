# @api private
#
class secure_linux_cis::distribution::rhel7::cis_5_4_2 {
  include secure_linux_cis::rules::ensure_system_accounts_are_non_login
}
