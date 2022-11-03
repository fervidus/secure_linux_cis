# @api private
#  Ensure authentication required for single user mode (Scored)
#
#
# Description:
# ingle user mode (rescue mode) is used for recovery when the system detects an issue during boot or by
# manual selection from the bootloader.
#
# @summary  Ensure authentication required for single user mode (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_code_dump_storage_is_disabled
class secure_linux_cis::rules::ensure_code_dump_storage_is_disabled {
  file_line { 'ensure_code_dump_storage_is_disabled':
    path  => '/etc/systemd/coredump.conf',
    line  => 'Storage=none',
    match => '^Storage=',
  }
}
