#
class secure_linux_cis::distribution::rhel8::cis_5_6 {
  include secure_linux_cis::rules::ensure_root_login_is_restricted_to_system_console
}
