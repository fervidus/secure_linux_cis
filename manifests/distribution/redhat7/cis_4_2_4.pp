# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::distribution::redhat7::cis_4_2_4
class secure_linux_cis::distribution::redhat7::cis_4_2_4 (
  Boolean $enforced = true,
) {

  if $enforced {

    # Recursively set permissions on /var/log
    # Note: Ignoring puppet logs because Puppet manages it's own log permissions
    file { '/var/log':
      ensure  => directory,
      recurse => true,
      mode    => 'g-wx,o-rwx',  #lint:ignore:no_symbolic_file_modes
      ignore  => 'puppet',
    }
  }
}
