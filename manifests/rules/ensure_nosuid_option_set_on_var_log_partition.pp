# @api private
#
# @summary Ensure nosuid option set on /var/log partition
#
class secure_linux_cis::rules::ensure_nosuid_option_set_on_var_log_partition {
  if '/var/log' in $facts['fstab_entries'] {
    augeas { '/etc/fstab - nosuid on /var/log':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after *[file = '/var/log']/opt[last()]",
        "set *[file = '/var/log']/opt[last()] nosuid",
      ],
      onlyif  => "match *[file = '/var/log']/opt[. = 'nosuid'] size == 0",
    }
  }
}
