# @api private
# 8 Ensure nodev option set on removable media partitions (Not Scored)
#
#
# Description:
# The nodev mount option specifies that the filesystem cannot contain special devices.
#
# @summary 8 Ensure nodev option set on removable media partitions (Not Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_nodev_option_set_on_removable_media_partitions
class secure_linux_cis::rules::ensure_nodev_option_set_on_removable_media_partitions(
    Boolean $enforced = true,
) {
  if $enforced {
    # Let's look at the name of each one and try to guess if it's removable
    $facts['mountpoints'].each | Tuple $mnt | {
      if($mnt[0] =~ /cdrom/ or $mnt[0] =~ /floppy/) {
        if member($facts['mountpoints'][$mnt[0]]['options'], 'nodev') == false {
          notify { "1_1_18 nodev ${mnt[0]}":
            message  =>  "POTENTIAL Not in compliance with CIS 8 (Not Scored). Ensure nodev option set on removable media partitions - ${mnt[0]}",  #lint:ignore:140chars
            schedule => 'harden_schedule',
            loglevel =>  'warning',
          }
        }
      }
    }
  }
}
