# @api private
#
class secure_linux_cis::distribution::centos8::cis_1_1_1_2 {
  include secure_linux_cis::rules::ensure_mounting_of_vFAT_filesystems_is_limited
}
