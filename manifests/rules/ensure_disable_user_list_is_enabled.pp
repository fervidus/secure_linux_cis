# @api private
#
# @summary Ensure disable-user-list is enabled 
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
