#
class secure_linux_cis::cis_centos7::cis_5_2_13 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_ssh_logingracetime_is_set_to_one_minute_or_less
}
