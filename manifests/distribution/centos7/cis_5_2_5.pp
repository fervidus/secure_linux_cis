#
class secure_linux_cis::distribution::centos7::cis_5_2_5 {
  include secure_linux_cis::rules::ensure_ssh_maxauthtries_is_set_to_4_or_less
}
