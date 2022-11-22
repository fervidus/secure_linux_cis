# @api private
#
# @summary Ensure nodev option set on /home partition 
#
class secure_linux_cis::rules::ensure_nodev_option_set_on_home_partition {
  if $facts['mountpoints']['/home'] {
    augeas { '/etc/fstab - nodev on /home':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after /files/etc/fstab/*[file = '/home']/opt[last()]",
        "set *[file = '/home']/opt[last()] nodev",
      ],
      onlyif  => "match *[file = '/home']/opt[. = 'nodev'] size == 0",
    }
  }
}
