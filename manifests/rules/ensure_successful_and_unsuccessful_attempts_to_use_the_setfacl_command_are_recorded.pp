# @api private
#
# @summary Ensure successful and unsuccessful attempts to use the setfacl command are recorded 
#
class secure_linux_cis::rules::ensure_successful_and_unsuccessful_attempts_to_use_the_setfacl_command_are_recorded {
  file { '/etc/audit/rules.d/50-priv_cmd.rules':
    ensure  => file,
    content => '-a always,exit -F path=/usr/bin/setfacl -F perm=x -F auid>=1000 -F auid!=unset -k perm_chng',
  }
}
