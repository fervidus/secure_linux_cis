# @api private
#
# @summary Ensure /tmp is a separate partition 
#
class secure_linux_cis::rules::ensure_tmp_is_a_separate_partition {
  include secure_linux_cis::rules::ensure_tmp_is_configured
}
