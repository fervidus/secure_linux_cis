#
class secure_linux_cis::centos6::cis_5_2_6 {
  include secure_linux_cis::rules::ensure_ssh_ignorerhosts_is_enabled
}
