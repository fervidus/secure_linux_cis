#
class secure_linux_cis::ubuntu18::cis_5_1_6 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_cron_monthly_are_configured
}
