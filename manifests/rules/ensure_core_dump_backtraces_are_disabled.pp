# @api private
#
# @summary Ensure core dump backtraces are disabled 
#
class secure_linux_cis::rules::ensure_core_dump_backtraces_are_disabled {
  file_line { 'Ensure core dump backtraces are disabled':
    ensure => present,
    path   => '/etc/systemd/coredump.conf',
    line   => 'ProcessSizeMax=0',
    match  => '^\s*(P|p)rocess(S|s)ize(M|m)ax\s*=',
  }
}
