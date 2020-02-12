# @api private
#
class secure_linux_cis::distribution::amazon2::cis_1_1_13 {
  include secure_linux_cis::rules::ensure_separate_partition_exists_for_home
}
