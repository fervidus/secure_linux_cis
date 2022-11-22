# @api private
#
# @summary Ensure sudo commands use pty 
#
class secure_linux_cis::rules::ensure_sudo_commands_use_pty {
  file_line { 'sudo_rule_pry':
    path  => '/etc/sudoers',
    line  => 'Defaults use_pty',
    match => '^#?Defaults\s+use_pty',
  }
}
