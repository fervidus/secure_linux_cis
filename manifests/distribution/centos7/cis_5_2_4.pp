#
class secure_linux_cis::distribution::centos7::cis_5_2_4 {
  include secure_linux_cis::rules::ensure_ssh_x11_forwarding_is_disabled
}
