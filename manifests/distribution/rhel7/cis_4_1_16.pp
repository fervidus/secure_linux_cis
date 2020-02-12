# @api private
#
class secure_linux_cis::distribution::rhel7::cis_4_1_16 {
  include secure_linux_cis::rules::ensure_system_administrator_actions_sudolog_are_collected
}
