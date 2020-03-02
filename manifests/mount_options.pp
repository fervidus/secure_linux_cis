# @api private
# @summary Check and fix a mount with a single option
#
# @param mount The mount point we have to check
# @param opt The options to check that mount for
#
# @example
#   secure_linux_cis::mount_options { 'namevar':
#     mount => $mountpoint,
#     opt   => $option,
#   }
define secure_linux_cis::mount_options (
  String $mount = '/root',
  String $opt = 'rw',
) {
  if $facts['mountpoints'][$mount] {
    if member($facts['mountpoints'][$mount]['options'], $opt) == false {

      augeas{ "/etc/fstab - ${opt} on ${mount}":
        context  => '/files/etc/fstab',
        schedule => 'harden_schedule',
        changes  => [
          "ins opt after /files/etc/fstab/*[file = '${mount}']/opt[last()]",
          "set *[file = '${mount}']/opt[last()] ${opt}",
        ],
        onlyif   => "match *[file = '${mount}']/opt[. = '${opt}'] size == 0",
        notify   => Exec["remount_${mount}_${opt}"],
      }

      exec { "remount_${mount}_${opt}":
        command     => "mount -o remount ${mount}",
        schedule    => 'harden_schedule',
        path        => '/bin/',
        refreshonly => true,
      }
    }
  }
}
