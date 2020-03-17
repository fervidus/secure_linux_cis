# @api private
#
class secure_linux_cis::distribution::debian10::cis_1_1_1_7 {
  include secure_linux_cis::rules::ensure_mounting_of_vfat_filesystems_is_limited
}
