# @api private
#  Ensure /tmp is configured (Scored)
#
# Description:
# The /tmp directory is a world-writable directory used for temporary storage
# by all users and some applications.
#
# @summary  Ensure /tmp is configured (Scored)
#
class secure_linux_cis::rules::ensure_var_tmp_is_configured {
  mount { '/var/tmp':
    ensure => 'mounted',
    target => '/etc/fstab',
    fstype => 'ext4',
  }
}
