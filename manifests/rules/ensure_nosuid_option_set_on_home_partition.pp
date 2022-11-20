# @api private
#  Ensure nosuid option set on /home partition (Scored)
#
# Description:
# The nosuid mount option specifies that the filesystem cannot contain setuid files.
#
# @summary  Ensure nosuid option set on /home partition (Scored)
#
class secure_linux_cis::rules::ensure_nosuid_option_set_on_home_partition {
  if $facts['mountpoints']['/home'] {
    augeas { '/etc/fstab - nosuid on /home':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after /files/etc/fstab/*[file = '/home']/opt[last()]",
        "set *[file = '/home']/opt[last()] nosuid",
      ],
      onlyif  => "match *[file = '/home']/opt[. = 'nosuid'] size == 0",
    }
  }
}
