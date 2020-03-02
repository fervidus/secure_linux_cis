# @api private
#
class secure_linux_cis::distribution::aliyun2::cis_1_1_18 {
  include secure_linux_cis::rules::ensure_sticky_bit_is_set_on_all_world_writable_directories
}
