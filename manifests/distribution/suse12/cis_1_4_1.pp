# @api private
#
class secure_linux_cis::distribution::suse12::cis_1_4_1 {
  include secure_linux_cis::rules::ensure_permissions_on_bootloader_config_are_configured
}
