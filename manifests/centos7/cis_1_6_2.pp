#
class secure_linux_cis::centos7::cis_1_6_2 {
  include secure_linux_cis::rules::ensure_selinux_is_installed
}
