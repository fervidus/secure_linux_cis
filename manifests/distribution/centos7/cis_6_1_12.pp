#
class secure_linux_cis::distribution::centos7::cis_6_1_12 {
  include secure_linux_cis::rules::ensure_no_ungrouped_files_or_directories_exist
}
