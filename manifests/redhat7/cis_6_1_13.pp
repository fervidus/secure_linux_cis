# # 6.1.13 Audit SUID executables (Not Scored)
# #
# #
# # Description:
# # The owner of a file can set the file's permissions to run with the owner's or group's permissions, even if the user running the
# # program is not the owner or a member of the group. The most common reason for a SUID program is to enable users to perform functions
# # (such as changing their password) that require root privileges.
# #
# # @summary 6.1.13 Audit SUID executables (Not Scored)
# #
# # @example
# #   include secure_linux_cis::redhat7::cis_6_1_13
# class secure_linux_cis::redhat7::cis_6_1_13 (
#   Boolean $enforced = true,
# ) {
#
#   if $enforced {
#     if $facts['suid_files'] {
#       notify { 'sf':
#         message  => '[6.1.13] (Not Scored) You have SUID files on your system. Check the suid_files
#         fact and ensure all files are authorized.', #lint:ignore:140chars
#       }
#     }
#   }
# }
#-------Data stored in suid_files
