# @api private
#
# @summary Ensure noexec option set on /var/tmp partition  
#
class secure_linux_cis::rules::ensure_noexec_option_set_on_var_tmp_partition {
  if '/var/tmp' in $facts['fstab_entries'] {
    augeas { '/etc/fstab - noexec on /var/tmp':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after *[file = '/var/tmp']/opt[last()]",
        "set *[file = '/var/tmp']/opt[last()] noexec",
      ],
      onlyif  => "match *[file = '/var/tmp']/opt[. = 'noexec'] size == 0",
    }
  }
}
