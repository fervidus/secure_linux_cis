#
class secure_linux_cis::debian9::cis_3_3_3 {
  include secure_linux_cis::rules::ensure_etc_hosts_deny_is_configured
}
