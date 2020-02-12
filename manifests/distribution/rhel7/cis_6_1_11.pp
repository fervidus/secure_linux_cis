# @api private
#
class secure_linux_cis::distribution::rhel7::cis_6_1_11 {
  include secure_linux_cis::rules::ensure_no_unowned_files_or_directories_exist
}
