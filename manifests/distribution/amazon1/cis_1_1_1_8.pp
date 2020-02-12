# @api private
#
class secure_linux_cis::distribution::amazon1::cis_1_1_1_8 {
  include secure_linux_cis::rules::ensure_mounting_of_fat_filesystems_is_disabled
}
