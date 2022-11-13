# @api private
#  Ensure noexec option set on /tmp partition (Scored)
#
#
# Description:
# The noexec mount option specifies that the filesystem cannot contain executable binaries.
#
# @summary  Ensure noexec option set on /tmp partition (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_noexec_option_set_on_tmp_partition
class secure_linux_cis::rules::ensure_noexec_option_set_on_tmp_partition {
  if $facts['mountpoints']['/tmp'] {
    augeas { '/etc/fstab - noexec on /tmp':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after /files/etc/fstab/*[file = '/tmp']/opt[last()]",
        "set *[file = '/tmp']/opt[last()] noexec",
      ],
      onlyif  => "match *[file = '/tmp']/opt[. = 'noexec'] size == 0",
    }
  }
}
