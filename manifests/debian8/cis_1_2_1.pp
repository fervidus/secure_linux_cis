#
class secure_linux_cis::cis_debian8::cis_1_2_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_package_manager_repositories_are_configured
}
