#
class secure_linux_cis::cis_centos6::cis_5_2_9 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_ssh_permitemptypasswords_is_disabled
}
