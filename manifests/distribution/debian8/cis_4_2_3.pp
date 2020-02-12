# @api private
#
class secure_linux_cis::distribution::debian8::cis_4_2_3 {
  include secure_linux_cis::rules::ensure_rsyslog_or_syslog_ng_is_installed
}
