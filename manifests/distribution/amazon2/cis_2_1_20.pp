# @api private
#
class secure_linux_cis::distribution::amazon2::cis_2_1_20 {
  include secure_linux_cis::rules::ensure_rsync_service_is_not_enabled
}
