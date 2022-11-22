# @api private
#
# @summary Ensure successful and unsuccessful attempts to use the chacl command are recorded 
#
class secure_linux_cis::rules::ensure_successful_and_unsuccessful_attempts_to_use_the_chacl_command_are_recorded {
  file { '/etc/audit/rules.d/50-perm_chacl.rules':
    ensure  => file,
    content => '-a always,exit -F path=/usr/bin/chacl -F perm=x -F auid>=1000 -F auid!=unset -k priv_cmd',
  }
}
