# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include secure_linux_cis::redhat7::cis_4_2_4
class secure_linux_cis::redhat7::cis_4_2_4 (
  Boolean $enforced = true,
) {

  if $enforced {

    # Recursively set permissions on /var/log
    # Note: Ignoring puppet logs because Puppet manages it's own log permissions
    file { '/var/log':
      ensure  => directory,
      recurse => true,
      mode    => 'g-wx,o-rwx',
      ignore  => 'puppet',
    }
  }
}
