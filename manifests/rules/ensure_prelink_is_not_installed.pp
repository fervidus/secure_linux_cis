# @api private
#
# @summary Ensure prelink is not installed 
#
class secure_linux_cis::rules::ensure_prelink_is_not_installed {
  include secure_linux_cis::rules::ensure_prelink_is_disabled
}
