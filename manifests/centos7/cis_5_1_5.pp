#
class secure_linux_cis::centos7::cis_5_1_5 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_cron_weekly_are_configured
}