#
class secure_linux_cis::distribution::ubuntu16::cis_1_4_3 {
  include secure_linux_cis::rules::ensure_authentication_required_for_single_user_mode
}
