#
class secure_linux_cis::distribution::rhel8::cis_1_7_1_6 {
  include secure_linux_cis::rules::ensure_setroubleshoot_is_not_installed
}
