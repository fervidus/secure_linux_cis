#
class secure_linux_cis::cis_centos7::cis_2_2_18 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_talk_server_is_not_enabled
}
