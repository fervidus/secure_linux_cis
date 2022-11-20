# @api private
# 6 Ensure nosuid option set on /dev/shm partition (Scored)
#
# Description:
# The nosuid mount option specifies that the filesystem cannot contain setuid files.
#
# @summary 6 Ensure nosuid option set on /dev/shm partition (Scored)
#
#
class secure_linux_cis::rules::ensure_nosuid_option_set_on_dev_shm_partition {
  if $facts['mountpoints']['/dev/shm'] {
    augeas { '/etc/fstab - nosuid on /dev/shm':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after /files/etc/fstab/*[file = '/dev/shm']/opt[last()]",
        "set *[file = '/dev/shm']/opt[last()] nosuid",
      ],
      onlyif  => "match *[file = '/dev/shm']/opt[. = 'nosuid'] size == 0",
    }
  }
}
