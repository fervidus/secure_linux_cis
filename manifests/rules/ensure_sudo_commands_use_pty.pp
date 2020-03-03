# @param enforced Should this rule be enforced
# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_sudo_commands_use_pty
class secure_linux_cis::rules::ensure_sudo_commands_use_pty(
    Boolean $enforced = true,
) {
  if $enforced {
    file_line { 'sudo_rule_pry':
      schedule => 'harden_schedule',
      path     => '/etc/sudoers',
      line     => 'Defaults use_pty',
      match    => '^#?Defaults\s+use_pty',
    }
  }
}
