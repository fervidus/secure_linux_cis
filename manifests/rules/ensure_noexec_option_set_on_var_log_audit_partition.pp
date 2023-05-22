# @api private
#
# @summary Ensure noexec option set on /var/log/audit partition
#
class secure_linux_cis::rules::ensure_noexec_option_set_on_var_log_audit_partition {
  if '/var/log/audit' in $facts['fstab_entries'] {
    augeas { '/etc/fstab - noexec on /var/log/audit':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after *[file = '/var/log/audit']/opt[last()]",
        "set *[file = '/var/log/audit']/opt[last()] noexec",
      ],
      onlyif  => "match *[file = '/var/log/audit']/opt[. = 'noexec'] size == 0",
    }
  }
}
