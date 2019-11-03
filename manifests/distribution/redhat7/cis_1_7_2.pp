# 1.7.2 Ensure GDM login banner is configured (Scored)
#
#
# Description:
# GDM is the GNOME Display Manager which handles graphical login for GNOME based systems.
#
# @summary 1.7.2 Ensure GDM login banner is configured (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::distribution::redhat7::cis_1_7_2
class secure_linux_cis::distribution::redhat7::cis_1_7_2 (
  Boolean $enforced = true,
) {

  if $enforced and !$facts['gnome_installed'].empty {

    file { '/etc/dconf/profile/gdm':
      ensure  => present,
      content => "user-db:user\nsystem-db:gdm\nfile-db:/usr/share/gdm/greeter-dconf-defaults",
    }

    file { '/etc/dconf/db/gdm.d/01-banner-message':
      ensure  => present,
      content => "[org/gnome/login-screen]\nbanner-message-enable=true\nbanner-message-text=\'Authorized uses only. All activity may be monitored and reported.\'", #lint:ignore:140chars
      require => File['/etc/dconf/profile/gdm'],
      notify  => Exec['dconf'],
    }

    exec { 'dconf':
      path        => '/bin/',
      command     => 'dconf update',
      refreshonly => true,
    }

  }
}
