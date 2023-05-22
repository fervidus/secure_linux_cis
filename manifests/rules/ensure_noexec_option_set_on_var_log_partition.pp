# @api private
#
# @summary Ensure noexec option set on /var/log partition
#
class secure_linux_cis::rules::ensure_noexec_option_set_on_var_log_partition {
  if '/var/log' in $facts['fstab_entries'] {
    augeas { '/etc/fstab - noexec on /var/log':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after *[file = '/var/log']/opt[last()]",
        "set *[file = '/var/log']/opt[last()] noexec",
      ],
      onlyif  => "match *[file = '/var/log']/opt[. = 'noexec'] size == 0",
    }
  }
}
