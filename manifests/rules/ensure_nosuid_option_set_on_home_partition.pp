# @api private
#
# @summary Ensure nosuid option set on /home partition
#
class secure_linux_cis::rules::ensure_nosuid_option_set_on_home_partition {
  if '/home' in $facts['fstab_entries'] {
    augeas { '/etc/fstab - nosuid on /home':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after *[file = '/home']/opt[last()]",
        "set *[file = '/home']/opt[last()] nosuid",
      ],
      onlyif  => "match *[file = '/home']/opt[. = 'nosuid'] size == 0",
    }
  }
}
