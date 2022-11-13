# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_noexec_option_set_on_run_shm_partition
class secure_linux_cis::rules::ensure_noexec_option_set_on_run_shm_partition {
  if $facts['mountpoints']['/run/shm'] {
    augeas { '/etc/fstab - noexec on /run/shm':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after /files/etc/fstab/*[file = '/run/shm']/opt[last()]",
        "set *[file = '/run/shm']/opt[last()] noexec",
      ],
      onlyif  => "match *[file = '/run/shm']/opt[. = 'noexec'] size == 0",
    }
  }
}
