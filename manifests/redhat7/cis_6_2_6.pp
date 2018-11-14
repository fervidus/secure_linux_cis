# 6.2.6 Ensure root PATH Integrity (Scored)
#
# @summary 6.2.6 Ensure root PATH Integrity (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_6
class secure_linux_cis::redhat7::cis_6_2_6 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/tmp/cis_scripts/root_path':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0711',
      content => file('secure_linux_cis/root_path.sh'),
      # force  => 'yes',
      # source  => 'puppet:///modules/secure_linux_cis/root_path.sh',
    }

    if $facts['root_path'] {
      notify { 'rp':
        message  => 'Not in compliance with CIS 6.2.6 (Scored). There is a "." or other writable directory in the root executable path. Check the root_path fact for details',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
