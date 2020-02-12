# @api private
#
class secure_linux_cis::distribution::centos8::cis_2_2_4 {
  include secure_linux_cis::rules::ensure_Avahi_Server_is_not_enabled
}
