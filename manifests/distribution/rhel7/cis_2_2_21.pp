# @api private
#
class secure_linux_cis::distribution::rhel7::cis_2_2_21 {
  include secure_linux_cis::rules::ensure_rsync_service_is_not_enabled
}
