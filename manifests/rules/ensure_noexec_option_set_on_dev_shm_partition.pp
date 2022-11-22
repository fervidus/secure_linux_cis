# @api private
#
# @summary Ensure noexec option set on /dev/shm partition 
#
class secure_linux_cis::rules::ensure_noexec_option_set_on_dev_shm_partition {
  if $facts['mountpoints']['/dev/shm'] {
    augeas { '/etc/fstab - noexec on /dev/shm':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after /files/etc/fstab/*[file = '/dev/shm']/opt[last()]",
        "set *[file = '/dev/shm']/opt[last()] noexec",
      ],
      onlyif  => "match *[file = '/dev/shm']/opt[. = 'noexec'] size == 0",
    }
  }
}
