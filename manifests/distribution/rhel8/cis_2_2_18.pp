#
class secure_linux_cis::distribution::rhel8::cis_2_2_18 {
  include secure_linux_cis::rules::ensure_mail_transfer_agent_is_configured_for_local_only_mode
}
