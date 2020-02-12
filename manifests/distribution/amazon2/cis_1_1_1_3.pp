# @api private
#
class secure_linux_cis::distribution::amazon2::cis_1_1_1_3 {
  include secure_linux_cis::rules::ensure_mounting_of_hfsplus_filesystems_is_disabled
}
