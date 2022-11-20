# @api private
#  Ensure authentication required for single user mode (Scored)
#
# Description:
# ingle user mode (rescue mode) is used for recovery when the system detects an issue during boot or by
# manual selection from the bootloader.
#
# @summary  Ensure authentication required for single user mode (Scored)
#
class secure_linux_cis::rules::ensure_code_dump_backtraces_are_disabled {
  file_line { 'ensure_code_dump_backtraces_are_disabled':
    path  => '/etc/systemd/coredump.conf',
    line  => 'ProcessSizeMax=0',
    match => '^ProcessSizeMax=',
  }
}
