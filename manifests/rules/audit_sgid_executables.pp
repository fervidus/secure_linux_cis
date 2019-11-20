# 4 Audit SGID executables (Not Scored)
#
#
# Description:
# The owner of a file can set the file's permissions to run with the owner's or group's permissions, even if the user running
# the program is not the owner or a member of the group. The most common reason for a SGID program
# is to enable users to perform functions (such as changing their password) that require root privileges.
#
# @summary 4 Audit SGID executables (Not Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::audit_sgid_executables

#
# NOTE: Not feasible for programatic enforcement
#

class secure_linux_cis::rules::audit_sgid_executables {
  # if $facts['sgid_files'] {
  #   notify { 'sgf':
  #     message  => '[4] (Not Scored) You have SGID files on your system. It is recommended to verify that
  #     the files have md5 checksums that match with their corresponding package', # lint:ignore:140chars
  #   }
  # }
}
