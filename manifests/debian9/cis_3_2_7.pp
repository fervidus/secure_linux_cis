#
class secure_linux_cis::cis_debian9::cis_3_2_7 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_reverse_path_filtering_is_enabled
}
