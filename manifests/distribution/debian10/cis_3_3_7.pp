# @api private
#
class secure_linux_cis::distribution::debian10::cis_3_3_7 {
  include secure_linux_cis::rules::ensure_reverse_path_filtering_is_enabled
}
