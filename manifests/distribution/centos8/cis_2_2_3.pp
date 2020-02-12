# @api private
#
class secure_linux_cis::distribution::centos8::cis_2_2_3 {
  include secure_linux_cis::rules::ensure_rsync_service_is_not_enabled
}
