# 5.4.4 Ensure default user umask is 027 or more restrictive (Scored)
#
#
# Description:
# The default umask determines the permissions of files created by users. The user creating the file has the discretion of making
# their files and directories readable by others via the chmod command. Users who wish to allow their files and directories to be
# readable by others by default may choose a different default umask by inserting the umask command into the standard shell
# configuration files ( .profile , .bashrc , etc.) in their home directories.
#
# @summary 5.4.4 Ensure default user umask is 027 or more restrictive (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::distribution::redhat7::cis_5_4_4
class secure_linux_cis::distribution::redhat7::cis_5_4_4 (
  Boolean $enforced = true,
) {

  $bashrc = $facts['os']['family'] ? {
    'RedHat' => '/etc/bashrc',
    'Debian' => '/etc/bash.bashrc',
  }

  if $enforced {

    file_line { 'bashrc':
      path     => $bashrc,
      line     => '      umask 077',
      match    => '^\s+umask\s+\d+',
      multiple => true,
    }

    file_line { 'profile':
      path     => '/etc/profile',
      line     => '    umask 077',
      match    => '^\s+umask\s+\d+',
      multiple => true,
    }

    file_line { 'login.defs':
      path  => '/etc/login.defs',
      line  => 'UMASK           077',
      match => '^\s+umask\s+\d+',
    }

    if $facts['os']['family'] == 'RedHat' {
      file_line { 'csh.cshrc':
        path     => '/etc/csh.cshrc',
        line     => '    umask 077',
        match    => '^\s+umask\s+\d+',
        multiple => true,
      }
    }
  }
}
