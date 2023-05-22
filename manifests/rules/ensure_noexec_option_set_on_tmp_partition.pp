# @api private
#
# @summary Ensure noexec option set on /tmp partition
#
class secure_linux_cis::rules::ensure_noexec_option_set_on_tmp_partition {
  if '/tmp' in $facts['fstab_entries'] {
    augeas { '/etc/fstab - noexec on /tmp':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after *[file = '/tmp']/opt[last()]",
        "set *[file = '/tmp']/opt[last()] noexec",
      ],
      onlyif  => "match *[file = '/tmp']/opt[. = 'noexec'] size == 0",
    }
  }
}
