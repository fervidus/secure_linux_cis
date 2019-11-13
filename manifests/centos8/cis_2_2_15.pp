#
class secure_linux_cis::cis_centos8::cis_2_2_15 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_mail_transfer_agent_is_configured_for_local_only_mode
}
