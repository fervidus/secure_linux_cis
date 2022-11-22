# @api private
#
# @summary Ensure SSH LogLevel is appropriate 
#
class secure_linux_cis::rules::ensure_ssh_loglevel_is_appropriate {
  # Both VERBOSE and INFO are considered appropriate, for Debian8 and Debian9
  include secure_linux_cis::rules::ensure_ssh_loglevel_is_set_to_info
}
