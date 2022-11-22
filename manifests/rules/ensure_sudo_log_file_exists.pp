# @api private
#
# @summary Ensure sudo log file exists 
#
class secure_linux_cis::rules::ensure_sudo_log_file_exists {
  file_line { 'sudo_log_file':
    path  => '/etc/sudoers',
    line  => 'Defaults logfile="/var/log/sudo.log"',
    match => '^#?\s*Defaults\s+logfile.+',
  }
}
