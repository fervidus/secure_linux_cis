#
class secure_linux_cis::cis_debian8::cis_2_3_3 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_talk_client_is_not_installed
}
