#
class secure_linux_cis::distribution::suse12::cis_2_2_15 {
  include secure_linux_cis::rules::ensure_mail_transfer_agent_is_configured_for_local_only_mode
}
