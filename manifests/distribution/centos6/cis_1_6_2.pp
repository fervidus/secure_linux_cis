# @api private
#
class secure_linux_cis::distribution::centos6::cis_1_6_2 {
  include secure_linux_cis::rules::ensure_selinux_is_installed
}
