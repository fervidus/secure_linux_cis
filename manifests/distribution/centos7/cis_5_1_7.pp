#
class secure_linux_cis::distribution::centos7::cis_5_1_7 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_cron_d_are_configured
}
