#
class secure_linux_cis::ubuntu16::cis_6_1_6 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_passwd_are_configured
}
