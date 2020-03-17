# @api private
#
class secure_linux_cis::distribution::debian10::cis_1_1_1_1 {
  include secure_linux_cis::rules::ensure_mounting_of_freevxfs_filesystems_is_disabled
}
