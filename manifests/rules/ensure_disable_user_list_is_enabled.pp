# @api private
#  Ensure discard services are not enabled (Scored)
#
# Description:
# discard is a network service that simply discards all data it receives.
# This service is intended for debugging and testing purposes. It is recommended that this service be disabled.
#
# Rationale:
# Disabling this service will reduce the remote attack surface of the system.
#
# @summary  Ensure discard services are not enabled (Scored)
#
class secure_linux_cis::rules::ensure_disable_user_list_is_enabled {
  ini_setting { 'disable-user-list':
    ensure  => present,
    path    => '/etc/gdm3/greeter.dconf-defaults',
    section => 'org/gnome/login-screen',
    setting => 'disable-user-list',
    value   => 'true',
  }
}
