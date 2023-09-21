# @api private
#
# @summary Ensure automatic mounting of removable media is disabled 
#
class secure_linux_cis::rules::ensure_automatic_mounting_of_removable_media_is_disabled {
  $system_audit_rules = @(SYSTEMAUDITRULES/L)
    [org/gnome/desktop/media-handling]
    automount=false
    automount-open=false
    | SYSTEMAUDITRULES

  file { '/etc/dconf/db/local.d/':
    ensure  => directory,
  }->
  file { '/etc/dconf/db/local.d/00-media-automount':
    ensure  => file,
    content => $system_audit_rules,
  }
  ~> exec { 'reload mount options':
    refreshonly => true,
    command     => 'dconf update && true',
    path        => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  }
}
