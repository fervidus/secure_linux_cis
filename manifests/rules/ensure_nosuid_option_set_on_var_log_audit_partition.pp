# @api private
#
# @summary Ensure nosuid option set on /var/log/audit partition
#
class secure_linux_cis::rules::ensure_nosuid_option_set_on_var_log_audit_partition {
  if '/var/log/audit' in $facts['fstab_entries'] {
    augeas { '/etc/fstab - nosuid on /var/log/audit':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after *[file = '/var/log/audit']/opt[last()]",
        "set *[file = '/var/log/audit']/opt[last()] nosuid",
      ],
      onlyif  => "match *[file = '/var/log/audit']/opt[. = 'nosuid'] size == 0",
    }
  }
}
