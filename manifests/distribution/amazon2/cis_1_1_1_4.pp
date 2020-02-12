# @api private
#
class secure_linux_cis::distribution::amazon2::cis_1_1_1_4 {
  include secure_linux_cis::rules::ensure_mounting_of_squashfs_filesystems_is_disabled
}
