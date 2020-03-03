# @param enforced Should this rule be enforced
# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_sudo_log_file_exists
class secure_linux_cis::rules::ensure_sudo_log_file_exists(
    Boolean $enforced = true,
) {
  if $enforced {
    file_line { 'sudo_log_file':
      schedule => 'harden_schedule',
      path     => '/etc/sudoers',
      line     => 'Defaults logfile="/var/log/sudo.log"',
      match    => '^#?\s*Defaults\s+logfile.+',
    }
  }
}
