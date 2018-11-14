# # 1.1.17 Ensure noexec option set on /dev/shm partition (Scored)
# #
# #
# # Description:
# # The noexec mount option specifies that the filesystem cannot contain executable binaries.
# #
# # @summary 1.1.17 Ensure noexec option set on /dev/shm partition (Scored)
# #
# # @example
# #   include secure_linux_cis::redhat7::cis_1_1_17
# class secure_linux_cis::redhat7::cis_1_1_17 (
#   Boolean $enforced = true,
#   ) {
#     if $enforced {
#
#       if $facts['shm_noexec'] == false {
#
#         notify { 'sne':
#           message  => 'Not in compliance with CIS 1.1.17 (Scored). The "noexec" option is not enabled on the /dev/shm partition',
#           loglevel => 'warning',
#         }
#       }
#     }
# }
# ---enforced by 1_1_15
