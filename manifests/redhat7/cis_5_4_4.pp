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
# @example
#   include secure_linux_cis::redhat7::cis_5_4_4
class secure_linux_cis::redhat7::cis_5_4_4 (
  Boolean $enforced = true,
) {

  if $enforced {

# The timeout parameter has been added for the 5.4.5 control for both files
    file_line { 'bashrc':
      path => '/etc/bashrc',
      line => 'umask 027',
    }
    file_line { 'bashrc_tmout':
      path => '/etc/bashrc',
      line => 'TMOUT=600',
    }

    file_line { 'profile':
      path => '/etc/profile',
      line => 'umask 027',
    }
    file_line { 'profile_tmout':
      path => '/etc/profile',
      line => 'TMOUT=600',
    }
  }
}
