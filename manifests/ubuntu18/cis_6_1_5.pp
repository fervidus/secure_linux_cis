#
class secure_linux_cis::ubuntu18::cis_6_1_5 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_gshadow_are_configured
}