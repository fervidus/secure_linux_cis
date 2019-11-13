#
class secure_linux_cis::cis_centos7::cis_1_6_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_selinux_is_installed
}
