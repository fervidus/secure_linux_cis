# @api private
#
# @summary Ensure grpquota option set on /home partition 
#
class secure_linux_cis::rules::ensure_grpquota_option_set_on_home_partition {
  if $facts['mountpoints']['/home'] {
    augeas { '/etc/fstab - grpquota on /home':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after /files/etc/fstab/*[file = '/home']/opt[last()]",
        "set *[file = '/home']/opt[last()] grpquota",
      ],
      onlyif  => "match *[file = '/home']/opt[. = 'grpquota'] size == 0",
    }
  }
}
