#
class secure_linux_cis::debian8::cis_1_6_3 {
  include secure_linux_cis::rules::ensure_selinux_or_apparmor_are_installed
}
