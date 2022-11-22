# @api private
#
# @summary Ensure /dev/shm is configured 
#
class secure_linux_cis::rules::ensure_dev_shm_is_configured {
  $mount   = '/dev/shm'

  mount { $mount:
    device => $mount,
    fstype => 'tmpfs',
    atboot => true,
  }
}
