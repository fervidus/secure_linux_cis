# @api private
#
# @summary Ensure nodev option set on /var/tmp partition
#
class secure_linux_cis::rules::ensure_nodev_option_set_on_var_tmp_partition {
  if '/var/tmp' in $facts['fstab_entries'] {
    augeas { '/etc/fstab - nodev on /var/tmp':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after *[file = '/var/tmp']/opt[last()]",
        "set *[file = '/var/tmp']/opt[last()] nodev",
      ],
      onlyif  => "match *[file = '/var/tmp']/opt[. = 'nodev'] size == 0",
    }
  }
}
