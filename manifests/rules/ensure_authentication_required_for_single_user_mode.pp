# @api private
#
# @summary Ensure authentication required for single user mode 
#
class secure_linux_cis::rules::ensure_authentication_required_for_single_user_mode {
  file { '/etc/systemd/system/rescue.service.d':
    ensure  => directory,
  }

  file { '/etc/systemd/system/rescue.service.d/00-require-auth.conf':
    ensure  => file,
    content => 'puppet:///modules/secure_linux_cis/00-require-auth.conf',
  }
}
