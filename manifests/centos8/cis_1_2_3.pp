#
class secure_linux_cis::centos8::cis_1_2_3 {
  include secure_linux_cis::rules::ensure_package_manager_repositories_are_configured
}
