# @api private
#  Ensure /var/tmp is configured (Scored)
#
#
# Description:
# The /tmp directory is a world-writable directory used for temporary storage
# by all users and some applications.
#
# @summary  Ensure /var/tmp is configured (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_var_tmp_partition_includes_the_nodev_option
class secure_linux_cis::rules::ensure_home_partition_includes_the_nodev_option {
  if $facts['mountpoints']['/tmp'] {
    augeas { '/etc/fstab - nodev on /tmp':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after /files/etc/fstab/*[file = '/tmp']/opt[last()]",
        "set *[file = '/tmp']/opt[last()] nodev",
      ],
      onlyif  => "match *[file = '/tmp']/opt[. = 'nodev'] size == 0",
    }
  }
}
