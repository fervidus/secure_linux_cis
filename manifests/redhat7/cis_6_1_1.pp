# 6.1.1 Audit system file permissions (Not Scored)
#
# Description:
# The RPM package manager has a number of useful options.
# One of these, the --verify (or - V ) option, can be used to verify that system packages are correctly installed. The --verify option can
# be used to verify a particular package
# or to verify all system packages. If no output is returned, the package is installed correctly. The following table describes the meaning
# of output from the verify option:
#
# Rationale:
# It is important to confirm that packaged system files and directories are
# maintained with the permissions they were intended to have from the OS vendor.
#
# @summary 6.1.1 Audit system file permissions (Not Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_1_1
# class secure_linux_cis::redhat7::cis_6_1_1 (
#   Boolean $enforced = true,
# ) {
#
#   if $enforced {
#
# # To view installed files and their permissions, run 'facter -p file_permissions'
#
#   }
# }
