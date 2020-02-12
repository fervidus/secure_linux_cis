# @api private
#
class secure_linux_cis::distribution::centos6::cis_2_2_3 {
  include secure_linux_cis::rules::ensure_avahi_server_is_not_enabled
}
