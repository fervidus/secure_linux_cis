#
class secure_linux_cis::distribution::ubuntu18::cis_3_2_7 {
  include secure_linux_cis::rules::ensure_reverse_path_filtering_is_enabled
}
