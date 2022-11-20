# @api private
# 0 Ensure noexec option set on /var/tmp partition (Scored)
#
# Description:
# The noexec mount option specifies that the filesystem cannot contain executable binaries.
#
# @summary 0 Ensure noexec option set on /var/tmp partition (Scored)
#
class secure_linux_cis::rules::ensure_noexec_option_set_on_var_tmp_partition {
  if $facts['mountpoints']['/var/tmp'] {
    augeas { '/etc/fstab - noexec on /var/tmp':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after /files/etc/fstab/*[file = '/var/tmp']/opt[last()]",
        "set *[file = '/var/tmp']/opt[last()] noexec",
      ],
      onlyif  => "match *[file = '/var/tmp']/opt[. = 'noexec'] size == 0",
    }
  }
}
