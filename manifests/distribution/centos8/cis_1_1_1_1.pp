#
class secure_linux_cis::distribution::centos8::cis_1_1_1_1 {
  include secure_linux_cis::rules::ensure_mounting_of_cramfs_filesystems_is_disabled
}
