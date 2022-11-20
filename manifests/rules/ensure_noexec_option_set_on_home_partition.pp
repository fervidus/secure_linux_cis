# @api private
# 7 Ensure noexec option set on /home partition (Scored)
#
# Description:
# The noexec mount option specifies that the filesystem cannot contain executable binaries.
#
# @summary 7 Ensure noexec option set on /home partition (Scored)
#
class secure_linux_cis::rules::ensure_noexec_option_set_on_home_partition {
  if $facts['mountpoints']['/home'] {
    augeas { '/etc/fstab - noexec on /home':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after /files/etc/fstab/*[file = '/home']/opt[last()]",
        "set *[file = '/home']/opt[last()] noexec",
      ],
      onlyif  => "match *[file = '/home']/opt[. = 'noexec'] size == 0",
    }
  }
}
