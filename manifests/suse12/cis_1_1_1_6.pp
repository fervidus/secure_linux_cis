#
class secure_linux_cis::suse12::cis_1_1_1_6 {
  include secure_linux_cis::rules::ensure_mounting_of_squashfs_filesystems_is_disabled
}
