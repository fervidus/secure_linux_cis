# @api private
#  Ensure /var/tmp is configured (Scored)
#
#
# Description:
# The /tmp directory is a world-writable directory used for temporary storage
# by all users and some applications.
#
# @summary  Ensure /var/tmp is configured (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_var_tmp_partition_includes_the_nodev_option
class secure_linux_cis::rules::ensure_var_tmp_partition_includes_the_nodev_option {
  include secure_linux_cis::rules::ensure_var_tmp_is_configured
}
