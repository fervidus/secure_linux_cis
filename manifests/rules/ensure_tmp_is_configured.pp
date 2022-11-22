# @api private
#
# @summary Ensure /tmp is configured 
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
