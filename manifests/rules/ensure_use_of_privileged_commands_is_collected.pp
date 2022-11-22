# @api private
#
# @summary Ensure use of privileged commands is collected 
#
class secure_linux_cis::rules::ensure_use_of_privileged_commands_is_collected {
  file { '/usr/share/cis_scripts/audit_priv.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => file('secure_linux_cis/audit_priv.sh'),
  }
  unless $facts['audit_privileged'].empty {
    file { '/etc/audit/rules.d/cis_4_1_12.rules':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0600',
      content => $facts['audit_privileged'],
    }
  }
}
