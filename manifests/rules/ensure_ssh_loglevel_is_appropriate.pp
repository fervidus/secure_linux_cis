# @api private
#  Ensure SSH LogLevel is set to INFO (Scored)
#
# Description:
# The INFO parameter specifies that login and logout activity will be logged.
#
# Rationale:
# SSH provides several logging levels with varying amounts of verbosity. DEBUG is
# specifically not recommended other than strictly for debugging SSH
# communications since it provides so much data that it is difficult to identify
# important security information. INFO level is the basic level that only records
# login activity of SSH users. In many situations, such as Incident Response, it
# is important to determine when a particular user was active on a system. The
# logout record can eliminate those users who disconnected, which helps narrow
# the field.
#
# @summary  Ensure SSH LogLevel is set to INFO (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_ssh_loglevel_is_appropriate
class secure_linux_cis::rules::ensure_ssh_loglevel_is_appropriate(
    Boolean $enforced = true,
) {
  if $enforced {
    # Both VERBOSE and INFO are considered appropriate, for Debian8 and Debian9
    include ::secure_linux_cis::rules::ensure_ssh_loglevel_is_set_to_info
  }
}
