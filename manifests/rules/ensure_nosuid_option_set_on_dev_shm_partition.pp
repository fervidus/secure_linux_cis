# @api private
#
# @summary Ensure nosuid option set on /dev/shm partition
#
class secure_linux_cis::rules::ensure_nosuid_option_set_on_dev_shm_partition {
  if '/dev/shm' in $facts['fstab_entries'] {
    augeas { '/etc/fstab - nosuid on /dev/shm':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after *[file = '/dev/shm']/opt[last()]",
        "set *[file = '/dev/shm']/opt[last()] nosuid",
      ],
      onlyif  => "match *[file = '/dev/shm']/opt[. = 'nosuid'] size == 0",
    }
  }
}
