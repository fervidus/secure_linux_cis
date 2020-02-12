# @api private
#
class secure_linux_cis::distribution::centos8::cis_4_2_1_2 {
  include secure_linux_cis::rules::ensure_rsyslog_Service_is_enabled
}
