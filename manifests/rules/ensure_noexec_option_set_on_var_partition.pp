# @api private
#
# @summary Ensure noexec option set on /var partition
#
class secure_linux_cis::rules::ensure_noexec_option_set_on_var_partition {
  if '/var' in $facts['fstab_entries'] {
    augeas { '/etc/fstab - noexec on /var':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after *[file = '/var']/opt[last()]",
        "set *[file = '/var']/opt[last()] noexec",
      ],
      onlyif  => "match *[file = '/var']/opt[. = 'noexec'] size == 0",
    }
  }
}
