# @api private
#
# @summary Ensure nosuid option set on /var partition
#
class secure_linux_cis::rules::ensure_nosuid_option_set_on_var_partition {
  if '/var' in $facts['fstab_entries'] {
    augeas { '/etc/fstab - nosuid on /var':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after *[file = '/var']/opt[last()]",
        "set *[file = '/var']/opt[last()] nosuid",
      ],
      onlyif  => "match *[file = '/var']/opt[. = 'nosuid'] size == 0",
    }
  }
}
