#
class secure_linux_cis::distribution::centos7::cis_5_2_1 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_ssh_sshd_config_are_configured
}
