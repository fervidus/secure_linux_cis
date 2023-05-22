# @api private
#
# @summary Ensure /home partition includes the nodev option
#
class secure_linux_cis::rules::ensure_home_partition_includes_the_nodev_option {
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
