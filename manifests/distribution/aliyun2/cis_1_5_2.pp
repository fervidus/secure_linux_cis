# @api private
#
class secure_linux_cis::distribution::aliyun2::cis_1_5_2 {
  include secure_linux_cis::rules::ensure_address_space_layout_randomization_aslr_is_enabled
}
