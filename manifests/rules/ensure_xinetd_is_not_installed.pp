# @api private
#
# @summary Ensure xinetd is not installed 
#
class secure_linux_cis::rules::ensure_xinetd_is_not_installed {
  package { 'xinetd':
    ensure   => absent,
  }
}
