# @api private
#  Ensure nosuid option set on /var/log partition (Scored)
#
#
# Description:
# The nosuid mount option specifies that the filesystem cannot contain setuid files.
#
# @summary  Ensure nosuid option set on /var/log partition (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_nosuid_option_set_on_var_log_partition
class secure_linux_cis::rules::ensure_nosuid_option_set_on_var_log_partition {
  if $facts['mountpoints']['/var/log'] {
    augeas { '/etc/fstab - nosuid on /var/log':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after /files/etc/fstab/*[file = '/var/log']/opt[last()]",
        "set *[file = '/var/log']/opt[last()] nosuid",
      ],
      onlyif  => "match *[file = '/var/log']/opt[. = 'nosuid'] size == 0",
    }
  }
}
