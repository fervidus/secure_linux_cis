# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_successful_and_unsuccessful_attempts_to_use_the_chcon_command_are_recorded {
  file { '/etc/audit/rules.d/50-perm_chcon.rules':
    ensure  => file,
    content => '-a always,exit -S all -F path=/usr/bin/chcon -F perm=x -F auid>=1000 -F auid!=-1 -F key=perm_chng',
  }
}
