# @api private
#
# @summary Ensure nosuid option set on /var partition 
#
class secure_linux_cis::rules::ensure_nosuid_option_set_on_var_partition {
  if $facts['mountpoints']['/var'] {
    augeas { '/etc/fstab - nosuid on /var':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after /files/etc/fstab/*[file = '/var']/opt[last()]",
        "set *[file = '/var']/opt[last()] nosuid",
      ],
      onlyif  => "match *[file = '/var']/opt[. = 'nosuid'] size == 0",
    }
  }
}
