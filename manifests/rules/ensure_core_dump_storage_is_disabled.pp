# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_core_dump_storage_is_disabled {
  file_line { 'Ensure core dump storage is disabled':
    ensure => present,
    path   => '/etc/systemd/coredump.conf',
    line   => 'Storage=none',
    match  => '^\s*(S|s)torage\s*=',
  }
}
