# 6.2.7 Ensure all users' home directories exist (Scored)
#
#
# Description:
# Users can be defined in /etc/passwd without a home directory or with a home directory that does not actually exist.
#
# @summary 6.2.7 Ensure all users' home directories exist (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_7
class secure_linux_cis::redhat7::cis_6_2_7 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/tmp/cis_scripts/home_directory':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0711',
      content => file('secure_linux_cis/home_directory.sh')
      # force  => 'yes',
      # source => 'puppet:///modules/secure_linux_cis/home_directory.sh',
    }

    if $facts['home_directory'] {
      notify { 'hdir':
        message  => 'Not in compliance with CIS 6.2.7 (Scored). You have a user(s) that does not have a home directory. Check the home_directory fact for details',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
