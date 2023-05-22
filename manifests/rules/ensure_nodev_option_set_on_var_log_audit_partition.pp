# @api private
#
# @summary Ensure nodev option set on /var/log/audit partition
#
class secure_linux_cis::rules::ensure_nodev_option_set_on_var_log_audit_partition {
  if '/var/log/audit' in $facts['fstab_entries'] {
    augeas { '/etc/fstab - nodev on /var/log/audit':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after *[file = '/var/log/audit']/opt[last()]",
        "set *[file = '/var/log/audit']/opt[last()] nodev",
      ],
      onlyif  => "match *[file = '/var/log/audit']/opt[. = 'nodev'] size == 0",
    }
  }
}
