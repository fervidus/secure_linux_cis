# @api private
# 0 Ensure noexec option set on /var/log/audit partition (Scored)
#
#
# Description:
# The noexec mount option specifies that the filesystem cannot contain executable binaries.
#
# @summary 0 Ensure noexec option set on /var/log/audit partition (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_noexec_option_set_on_var_log_audit_partition
class secure_linux_cis::rules::ensure_noexec_option_set_on_var_log_audit_partition {
  if $facts['mountpoints']['/var/log/audit'] {
    augeas { '/etc/fstab - noexec on /var/log/audit':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after /files/etc/fstab/*[file = '/var/log/audit']/opt[last()]",
        "set *[file = '/var/log/audit']/opt[last()] noexec",
      ],
      onlyif  => "match *[file = '/var/log/audit']/opt[. = 'noexec'] size == 0",
    }
  }
}
