# @api private
# 0 Ensure noexec option set on removable media partitions (Not Scored)
#
#
# Description:
# The noexec mount option specifies that the filesystem cannot contain executable binaries.
#
# @summary 0 Ensure noexec option set on removable media partitions (Not Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_removable_media_partitions_include_noexec_option
class secure_linux_cis::rules::ensure_removable_media_partitions_include_noexec_option {
  include secure_linux_cis::rules::ensure_noexec_option_set_on_removable_media_partitions
}
