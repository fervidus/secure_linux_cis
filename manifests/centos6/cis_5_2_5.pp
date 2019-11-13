#
class secure_linux_cis::cis_centos6::cis_5_2_5 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_ssh_maxauthtries_is_set_to_4_or_less
}
