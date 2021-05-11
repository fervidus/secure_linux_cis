# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_last_logged_in_user_display_is_disabled
class secure_linux_cis::rules::ensure_last_logged_in_user_display_is_disabled {
  # Ensure gnome configruation exists
  file { ['/etc/dconf', '/etc/dconf/profile', '/etc/dconf/db', '/etc/dconf/db/gdm.d']:
    ensure => directory,
  }

  file { '/etc/dconf/profile/gdm':
    ensure => file,
  }

  file_line {'remove_user-db':
    ensure => present,
    path   => '/etc/dconf/profile/gdm',
    line   => 'user-db:user',
  }

  file_line {'remove_system-db':
    ensure => present,
    path   => '/etc/dconf/profile/gdm',
    line   => 'system-db:gdm',
  }

  file_line {'remove_file-db':
    ensure => present,
    path   => '/etc/dconf/profile/gdm',
    line   => 'file-db:/usr/share/gdm/greeter-dconf-defaults',
  }

  $gdmconfig = @("GDMCONFIG"/L)
    [org/gnome/login-screen]
    # Do not show the user list
    disable-user-list=true
    | GDMCONFIG

  file { '/etc/dconf/db/gdm.d/00-login-screen':
    ensure  => file,
    content => $gdmconfig,
  }

  exec { 'dconf':
    command     => 'dconf update',
    path        => ['/usr/local/sbin', '/usr/local/bin', '/sbin', '/bin', '/usr/sbin', '/usr/bin', '/root/bin'],
    refreshonly => true,
    subscribe   => File['/etc/dconf/profile/gdm', '/etc/dconf/db/gdm.d/00-login-screen'],
  }
}
