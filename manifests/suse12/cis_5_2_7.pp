#
class secure_linux_cis::suse12::cis_5_2_7 {
  include secure_linux_cis::rules::ensure_ssh_hostbasedauthentication_is_disabled
}
