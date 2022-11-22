# @api private
#
# @summary Ensure interactive boot is not enabled 
#
class secure_linux_cis::rules::ensure_interactive_boot_is_not_enabled {
  # Set the default inactivity period
  # The command 'useradd -D -f 30' does the same as editting
  # /etc/default/useradd directly.
  file_line { 'no_interactive_boot':
    ensure => present,
    path   => '/etc/sysconfig/init',
    line   => 'PROMPT=no',
    match  => '^#?PROMPT=',
  }
}
