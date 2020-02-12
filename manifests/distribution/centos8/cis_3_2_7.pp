# @api private
#
class secure_linux_cis::distribution::centos8::cis_3_2_7 {
  include secure_linux_cis::rules::ensure_Reverse_Path_Filtering_is_enabled
}
