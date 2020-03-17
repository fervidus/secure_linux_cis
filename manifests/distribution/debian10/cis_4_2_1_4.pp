# @api private
#
class secure_linux_cis::distribution::debian10::cis_4_2_1_4 {
  include secure_linux_cis::rules::ensure_rsyslog_default_file_permissions_configured
}
