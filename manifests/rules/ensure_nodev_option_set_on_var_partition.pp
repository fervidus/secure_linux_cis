# @api private
#
# @summary Ensure nodev option set on /var partition 
#
class secure_linux_cis::rules::ensure_nodev_option_set_on_var_partition {
  if $facts['mountpoints']['/var'] {
    augeas { '/etc/fstab - nodev on /var':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after /files/etc/fstab/*[file = '/var']/opt[last()]",
        "set *[file = '/var']/opt[last()] nodev",
      ],
      onlyif  => "match *[file = '/var']/opt[. = 'nodev'] size == 0",
    }
  }
}
