#
class secure_linux_cis::debian8::cis_1_6_2_2 {
  include secure_linux_cis::rules::ensure_all_apparmor_profiles_are_enforcing
}
