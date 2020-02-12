# @api private
#
class secure_linux_cis::distribution::centos7::cis_5_1_2 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_crontab_are_configured
}
