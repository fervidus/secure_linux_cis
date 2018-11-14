# 1.7.2 Ensure GDM login banner is configured (Scored)
#
#
# Description:
# GDM is the GNOME Display Manager which handles graphical login for GNOME based systems.
#
# @summary 1.7.2 Ensure GDM login banner is configured (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_7_2
class secure_linux_cis::redhat7::cis_1_7_2 (
  Boolean $enforced = true,
) {

  if $enforced and $facts['gnome_installed'] {

    file { 'gdm':
      ensure  => present,
      path    => '/etc/dconf/profile/gdm',
      content => "user-db:user\nsystem-db:gdm\nfile-db:/usr/share/gdm/greeter-dconf-defaults",
    }
    file { 'banner-login':
      ensure  => present,
      path    => '/etc/dconf/db/gdm.d/01-banner-message',
      content => "[org/gnome/login-screen]\nbanner-message-enable=true\nbanner-message-text=\'Authorized uses only. All activity may be monitored and reported.\'", #lint:ignore:140chars
      require => File['gdm'],
      notify  => Exec['dconf'],
    }
    exec { 'dconf':
      path        => '/bin/',
      command     => 'dconf update',
      refreshonly => true,
    }

    # File['gdm'] -> File['banner-login'] ~> Exec['dconf']
  }
}
