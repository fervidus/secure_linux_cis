# @api private
#
class secure_linux_cis::distribution::debian9::cis_1_1_1_2 {
  include secure_linux_cis::rules::ensure_mounting_of_jffs2_filesystems_is_disabled
}
