#
class secure_linux_cis::distribution::rhel6::cis_1_1_1_3 {
  include secure_linux_cis::rules::ensure_mounting_of_jffs2_filesystems_is_disabled
}
