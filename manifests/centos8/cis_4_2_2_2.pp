#
class secure_linux_cis::centos8::cis_4_2_2_2 {
  include secure_linux_cis::rules::ensure_journald_is_configured_to_compress_large_log_files
}
