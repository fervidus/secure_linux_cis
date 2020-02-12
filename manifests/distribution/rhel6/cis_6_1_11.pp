# @api private
#
class secure_linux_cis::distribution::rhel6::cis_6_1_11 {
  include secure_linux_cis::rules::ensure_no_unowned_files_or_directories_exist
}
