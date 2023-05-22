# @api private
#
# @summary Ensure nodev option set on /var partition
#
class secure_linux_cis::rules::ensure_nodev_option_set_on_var_partition {
  if '/var' in $facts['fstab_entries'] {
    augeas { '/etc/fstab - nodev on /var':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after *[file = '/var']/opt[last()]",
        "set *[file = '/var']/opt[last()] nodev",
      ],
      onlyif  => "match *[file = '/var']/opt[. = 'nodev'] size == 0",
    }
  }
}
