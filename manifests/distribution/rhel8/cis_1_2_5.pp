# @api private
#
class secure_linux_cis::distribution::rhel8::cis_1_2_5 {
  include secure_linux_cis::rules::ensure_package_manager_repositories_are_configured
}
