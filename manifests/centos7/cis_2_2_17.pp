#
class secure_linux_cis::centos7::cis_2_2_17 {
  include secure_linux_cis::rules::ensure_rsh_server_is_not_enabled
}
