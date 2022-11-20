# @api private
#  Ensure /tmp is configured (Scored)
#
# Description:
# The /tmp directory is a world-writable directory used for temporary storage
# by all users and some applications.
#
# @summary  Ensure /tmp is configured (Scored)
#
class secure_linux_cis::rules::ensure_tmp_is_configured {
  mount { '/tmp':
    ensure => 'mounted',
    device => 'tmpfs',
    dump   => '0',
    fstype => 'tmpfs',
    pass   => '0',
    target => '/etc/fstab',
  }
}
