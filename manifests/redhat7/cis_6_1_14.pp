# # 6.1.14 Audit SGID executables (Not Scored)
# #
# #
# # Description:
# # The owner of a file can set the file's permissions to run with the owner's or group's permissions, even if the user running
# # the program is not the owner or a member of the group. The most common reason for a SGID program
# # is to enable users to perform functions (such as changing their password) that require root privileges.
# #
# # @summary 6.1.14 Audit SGID executables (Not Scored)
# #
# # @example
# #   include secure_linux_cis::redhat7::cis_6_1_14
# class secure_linux_cis::redhat7::cis_6_1_14 (
#   Boolean $enforced = true,
# ) {
#
#   if $enforced {
#     if $facts['sgid_files'] {
#       notify { 'sgf':
#         message  => '[6.1.14] (Not Scored) You have SGID files on your system. It is recommended to verify that
#         the files have md5 checksums that match with their corresponding package', # lint:ignore:140chars
#       }
#     }
#   }
# }
#-------Data stored in sgid_files
