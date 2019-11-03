# 1.2.1 Ensure package manager repositories are configured (Not Scored)
#
#
# Description:
# Systems need to have package manager repositories configured to ensure they receive the latest patches and updates.
#
# @summary 1.2.1 Ensure package manager repositories are configured (Not Scored)
#
# @param enforced Should this rule be enforced
# @param repolist List of allowed repositories
#
# @example
#   include secure_linux_cis::distribution::redhat7::cis_1_2_1
class secure_linux_cis::distribution::redhat7::cis_1_2_1 (
  Boolean $enforced = true,
  Array $repolist = ['rhel-7-server-rpms/7Server/x86_64']
) {

  if $enforced {
    if($facts['yum_repolist'] != undef) {
      if member($repolist, $facts['yum_repolist']) == false {
        notify { "No approved repo found in list:  ${repolist}": }
      }
    }

  }
}
