#  Ensure GDM login banner is configured (Scored)
#
#
# Description:
# GDM is the GNOME Display Manager which handles graphical login for GNOME based systems.
#
# @summary  Ensure GDM login banner is configured (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_gdm_login_banner_is_configured

class secure_linux_cis::rules::ensure_gdm_login_banner_is_configured {

  if $facts['gnome_installed'] {

    file { '/etc/dconf/profile/gdm':
      ensure  => present,
      content => "user-db:user\nsystem-db:gdm\nfile-db:/usr/share/gdm/greeter-dconf-defaults",
    }

    file { '/etc/dconf/db/gdm.d/01-banner-message':
      ensure  => present,
      content => "[org/gnome/login-screen]\nbanner-message-enable=true\nbanner-message-text=\'Authorized uses only. All activity may be monitored and reported.\'", #lint:ignore:140chars
      notify  => Exec['dconf'],
    }

    exec { 'dconf':
      path        => '/bin/',
      command     => 'dconf update',
      refreshonly => true,
    }
  }
}
