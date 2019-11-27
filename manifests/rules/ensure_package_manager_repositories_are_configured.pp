#  Ensure package manager repositories are configured (Not Scored)
#
#
# Description:
# Systems need to have package manager repositories configured to ensure they receive the latest patches and updates.
#
# @summary  Ensure package manager repositories are configured (Not Scored)
#
# @param enforced Should this rule be enforced
# @param repolist List of allowed repositories
#
# @example
#   include secure_linux_cis::ensure_package_manager_repositories_are_configured
class secure_linux_cis::rules::ensure_package_manager_repositories_are_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    if($facts['yum_repolist'] != undef) {
      if member($::secure_linux_cis::repolist, $facts['yum_repolist']) == false {
        notify { "No approved repo found in list:  ${::secure_linux_cis::repolist}": }
      }
    }
  }
}
