#
class secure_linux_cis::suse12::cis_5_1_2 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_crontab_are_configured
}
