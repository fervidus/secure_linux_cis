# @api private
#  Ensure /var/tmp is configured (Scored)
#
# Description:
# The /tmp directory is a world-writable directory used for temporary storage
# by all users and some applications.
#
# @summary  Ensure /var/tmp is configured (Scored)
#
class secure_linux_cis::rules::ensure_var_tmp_partition_includes_the_noexec_option {
  include secure_linux_cis::rules::ensure_noexec_option_set_on_var_tmp_partition
}
