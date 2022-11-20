# @api private
#  Ensure access to the su command is restricted (Scored)
#
# Description:
# The su command allows a user to run a command or shell as another user. The program has been superseded by sudo , which allows for more
# granular control over privileged access. Normally, the su command can be executed by any user. By uncommenting the pam_wheel.so
# statement in /etc/pam.d/su , the su command will only allow users in the wheel group to execute su .
#
# @summary  Ensure access to the su command is restricted (Scored)
#
class secure_linux_cis::rules::ensure_access_to_the_su_command_is_restricted {
  group { 'su_group':
    ensure  => present,
    members => [],
  }

  $os = "${facts['os']['name']}${facts['os']['release']['major']}"

  $group = $os ? {
    'Debian10' => " group=${secure_linux_cis::su_group}",
    default    => '',
  }

  file_line { 'su':
    path              => '/etc/pam.d/su',
    line              => 'auth required pam_wheel.so use_uid group=su_group',
    match             => '^\s*auth\s+required\s+pam_wheel\.so\s+(\S+\s+)*use_uid\s+(\S+\s+)*group=\S+\ s*(\S+\s*)*(\s+#.*)?$',
    match_for_absence => true,
  }

  # exec { 'root_wheel':
  #   command => "usermod -G ${secure_linux_cis::su_group} root",
  #   unless  => "grep ${secure_linux_cis::su_group} /etc/group | grep root",
  #   path    => '/bin/:/sbin/:/usr/bin/:/usr/sbin/',
  # }
}
