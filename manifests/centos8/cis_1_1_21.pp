#
class secure_linux_cis::centos8::cis_1_1_21 {
  include secure_linux_cis::rules::ensure_sticky_bit_is_set_on_all_world_writable_directories
}
