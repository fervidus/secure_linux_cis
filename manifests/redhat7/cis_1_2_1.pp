# # 1.2.1 Ensure package manager repositories are configured (Not Scored)
# #
# #
# # Description:
# # Systems need to have package manager repositories configured to ensure they receive the latest patches and updates.
# #
# # @summary 1.2.1 Ensure package manager repositories are configured (Not Scored)
# #
# # @example
# #   include secure_linux_cis::redhat7::cis_1_2_1
# class secure_linux_cis::redhat7::cis_1_2_1 (
#   Boolean $enforced = true,
# ) {
#
#   if $enforced {
#     exec { 'repolist':
#       command => 'yum repolist > /tmp/repolist.txt',
#       creates => '/tmp/repolist.txt',
#       path    => '/bin/',
#       notify  => Notify['yum_repo'],
#       }
#     notify { 'yum_repo':
#       message => '[1.2.1] (Not Scored) Your Yum repo configurations have been stored in /tmp/repolist.txt. Please review and ensure all
#       repos are in desired state', #lint:ignore:140chars
#     }
#   }
# }
#------Data is stored in yum_repolist
