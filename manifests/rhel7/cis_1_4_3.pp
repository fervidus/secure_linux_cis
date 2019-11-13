#
class secure_linux_cis::cis_rhel7::cis_1_4_3 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_authentication_required_for_single_user_mode
}
