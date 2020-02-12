# @api private
#
class secure_linux_cis::distribution::centos7::cis_3_4_2 {
  include secure_linux_cis::rules::ensure_etc_hosts_allow_is_configured
}
