# @api private
#  Ensure default user umask is 027 or more restrictive (Scored)
#
#
# Description:
# The default umask determines the permissions of files created by users. The user creating the file has the discretion of making
# their files and directories readable by others via the chmod command. Users who wish to allow their files and directories to be
# readable by others by default may choose a different default umask by inserting the umask command into the standard shell
# configuration files ( .profile , .bashrc , etc.) in their home directories.
#
# @summary  Ensure default user umask is 027 or more restrictive (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_default_user_umask_is_027_or_more_restrictive
class secure_linux_cis::rules::ensure_default_user_umask_is_027_or_more_restrictive(
    Boolean $enforced = true,
) {
  if $enforced {
    $bashrc = $facts['osfamily'] ? {
      'Suse'   => '/etc/bash.bashrc',
      'RedHat' => '/etc/bashrc',
      'Debian' => '/etc/bash.bashrc',
    }

    file_line { 'bashrc':
      schedule => 'harden_schedule',
      path     => $bashrc,
      line     => '      umask 077',
      match    => '^\s+umask\s+\d+',
      multiple => true,
    }

    file_line { 'profile':
      schedule => 'harden_schedule',
      path     => '/etc/profile',
      line     => '    umask 077',
      match    => '^\s+umask\s+\d+',
      multiple => true,
    }

    file_line { 'login.defs':
      schedule => 'harden_schedule',
      path     => '/etc/login.defs',
      line     => 'UMASK           077',
      match    => '^\s+umask\s+\d+',
    }

    if $facts['osfamily'] == 'RedHat' {
      file_line { 'csh.cshrc':
        schedule => 'harden_schedule',
        path     => '/etc/csh.cshrc',
        line     => '    umask 077',
        match    => '^\s+umask\s+\d+',
        multiple => true,
      }
    }
  }
}
