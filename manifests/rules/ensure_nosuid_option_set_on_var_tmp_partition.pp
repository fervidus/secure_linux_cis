# @api private
#
# @summary Ensure nosuid option set on /var/tmp partition
#
class secure_linux_cis::rules::ensure_nosuid_option_set_on_var_tmp_partition {
  if '/var/tmp' in $facts['fstab_entries'] {
    augeas { '/etc/fstab - nosuid on /var/tmp':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after *[file = '/var/tmp']/opt[last()]",
        "set *[file = '/var/tmp']/opt[last()] nosuid",
      ],
      onlyif  => "match *[file = '/var/tmp']/opt[. = 'nosuid'] size == 0",
    }
  }
}
