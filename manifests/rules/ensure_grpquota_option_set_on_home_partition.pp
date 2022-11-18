# @api private
# 4 Ensure grpquota option set on /home partition (Scored)
#
#
# Description:
# The grpquota mount option specifies that the filesystem cannot contain special devices.
#
# @summary 4 Ensure grpquota option set on /home partition (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_grpquota_option_set_on_home_partition
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
