# 6.2.9 Ensure users own their home directories (Scored)
#
#
# Description:
# The user home directory is space defined for the particular user to set local environment variables and to store personal files.
#
# @summary 6.2.9 Ensure users own their home directories (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_9
class secure_linux_cis::redhat7::cis_6_2_9 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/tmp/cis_scripts/home_dir_own.sh':
      owner   => 'root',
      group   => 'root',
      mode    => '0711',
      content => file('secure_linux_cis/home_dir_own.sh')
      # source => 'puppet:///modules/secure_linux_cis/home_dir_own.sh',
    }

    if !($facts[ 'home_directory_owner' ].empty) {

      notify { 'hdo':
        message  => 'Not in compliance with CIS 6.2.9 (Scored). You have a home directory that is not owned by a user. Check the home_directory_owner fact for details',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
