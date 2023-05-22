# @api private
#
# @summary Ensure nodev option set on /tmp partition
#
class secure_linux_cis::rules::ensure_nodev_option_set_on_tmp_partition {
  if '/tmp' in $facts['fstab_entries'] {
    augeas { '/etc/fstab - nodev on /tmp':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after *[file = '/tmp']/opt[last()]",
        "set *[file = '/tmp']/opt[last()] nodev",
      ],
      onlyif  => "match *[file = '/tmp']/opt[. = 'nodev'] size == 0",
    }
  }
}
