# @api private
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
  # Not scored
  # if $enforced {
  #   $repolist = "${facts['os']['name']}/${facts['os']['release']['major']}" ? {
  #     'CentOS/7' => ['updates/7/x86_64'],
  #     'CentOS/8' => ['BaseOS','AppStream'],
  #     'RedHat/7' => ['rhel-7-server-rpms/7Server/x86_64'],
  #   }

  #   if($facts['yum_repolist'] != undef) {
  #     if (intersection($facts['yum_repolist'].split("\n"), $repolist).empty) {
  #       notify { "No approved repo from ${repolist} found on this system.  Check the yum_repolist fact for more information": }
  #     }
  #   }
  # }
}
