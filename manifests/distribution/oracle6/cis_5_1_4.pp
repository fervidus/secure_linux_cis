# @api private
#
class secure_linux_cis::distribution::oracle6::cis_5_1_4 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_cron_daily_are_configured
}
