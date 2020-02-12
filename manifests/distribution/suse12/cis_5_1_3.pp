# @api private
#
class secure_linux_cis::distribution::suse12::cis_5_1_3 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_cron_hourly_are_configured
}
