#
class secure_linux_cis::cis_rhel7::cis_5_6 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_access_to_the_su_command_is_restricted
}
