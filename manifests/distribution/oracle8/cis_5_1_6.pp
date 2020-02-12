# @api private
#
class secure_linux_cis::distribution::oracle8::cis_5_1_6 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_cron_monthly_are_configured
}
