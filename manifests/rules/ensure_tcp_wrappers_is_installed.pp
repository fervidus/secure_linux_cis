# @api private
#
# @summary Ensure TCP Wrappers is installed 
#
class secure_linux_cis::rules::ensure_tcp_wrappers_is_installed {
  package { $secure_linux_cis::tcp_wrappers_package:
    ensure   => installed,
  }
}
