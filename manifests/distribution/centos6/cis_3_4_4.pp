# @api private
#
class secure_linux_cis::distribution::centos6::cis_3_4_4 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_hosts_allow_are_configured
}
