# @api private
#
# @summary Ensure /var/tmp partition includes the noexec option 
#
class secure_linux_cis::rules::ensure_var_tmp_partition_includes_the_noexec_option {
  include secure_linux_cis::rules::ensure_noexec_option_set_on_var_tmp_partition
}
