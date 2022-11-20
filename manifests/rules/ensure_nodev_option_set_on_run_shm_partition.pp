# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_nodev_option_set_on_run_shm_partition {
  if $facts['mountpoints']['/run/shm'] {
    augeas { '/etc/fstab - nodev on /run/shm':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after /files/etc/fstab/*[file = '/run/shm']/opt[last()]",
        "set *[file = '/run/shm']/opt[last()] nodev",
      ],
      onlyif  => "match *[file = '/run/shm']/opt[. = 'nodev'] size == 0",
    }
  }
}
