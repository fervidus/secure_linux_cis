# @api private
#
# @summary Ensure nosuid option set on /var/log/audit partition 
#
class secure_linux_cis::rules::ensure_nosuid_option_set_on_var_log_audit_partition {
  if $facts['mountpoints']['/var/log/audit'] {
    augeas { '/etc/fstab - nosuid on /var/log/audit':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after /files/etc/fstab/*[file = '/var/log/audit']/opt[last()]",
        "set *[file = '/var/log/audit']/opt[last()] nosuid",
      ],
      onlyif  => "match *[file = '/var/log/audit']/opt[. = 'nosuid'] size == 0",
    }
  }
}
