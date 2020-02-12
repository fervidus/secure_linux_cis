# @api private
#
class secure_linux_cis::distribution::suse12::cis_4_2_2_3 {
  include secure_linux_cis::rules::ensure_syslog_ng_default_file_permissions_configured
}
