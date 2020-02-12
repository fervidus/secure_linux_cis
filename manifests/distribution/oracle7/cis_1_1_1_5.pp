# @api private
#
class secure_linux_cis::distribution::oracle7::cis_1_1_1_5 {
  include secure_linux_cis::rules::ensure_mounting_of_hfsplus_filesystems_is_disabled
}
