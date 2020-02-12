# @api private
#
class secure_linux_cis::distribution::centos6::cis_2_1_10 {
  include secure_linux_cis::rules::ensure_rsync_service_is_not_enabled
}
