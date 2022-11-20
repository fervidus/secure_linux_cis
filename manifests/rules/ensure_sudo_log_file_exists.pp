# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_sudo_log_file_exists {
  file_line { 'sudo_log_file':
    path  => '/etc/sudoers',
    line  => 'Defaults logfile="/var/log/sudo.log"',
    match => '^#?\s*Defaults\s+logfile.+',
  }
}
