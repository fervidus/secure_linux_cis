# @api private
#
# @summary Ensure usrquota option set on /home partition 
#
class secure_linux_cis::rules::ensure_usrquota_option_set_on_home_partition {
  if $facts['mountpoints']['/home'] {
    augeas { '/etc/fstab - usrquota on /home':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after /files/etc/fstab/*[file = '/home']/opt[last()]",
        "set *[file = '/home']/opt[last()] usrquota",
      ],
      onlyif  => "match *[file = '/home']/opt[. = 'usrquota'] size == 0",
    }
  }
}
