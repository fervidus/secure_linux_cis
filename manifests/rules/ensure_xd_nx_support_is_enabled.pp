# @api private
#
# @summary Ensure XD/NX support is enabled 
#
class secure_linux_cis::rules::ensure_xd_nx_support_is_enabled {
  if(! $facts['nx_dmesg']) {
    notify { 'NX':
      message  => '[] (Not Scored) Please run "dmesg | grep NX" and verify that No Execute (or Execute Disable, for some Intel
          processors) protection is enabled', #lint:ignore:140chars
    }
  }
}
