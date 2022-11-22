# @api private
#
# @summary Ensure removable media partitions include noexec option 
#
class secure_linux_cis::rules::ensure_removable_media_partitions_include_noexec_option {
  include secure_linux_cis::rules::ensure_noexec_option_set_on_removable_media_partitions
}
