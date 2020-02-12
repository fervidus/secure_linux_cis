# @api private
#
class secure_linux_cis::distribution::ubuntu16::cis_1_1_1_2 {
  include secure_linux_cis::rules::ensure_mounting_of_freevxfs_filesystems_is_disabled
}
