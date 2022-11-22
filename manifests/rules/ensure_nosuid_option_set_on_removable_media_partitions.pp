# @api private
#
# @summary Ensure nosuid option set on removable media partitions 
#
class secure_linux_cis::rules::ensure_nosuid_option_set_on_removable_media_partitions {
  # Let's look at the name of each one and try to guess if it's removable
  $facts['mountpoints'].each | Tuple $mnt | {
    if($mnt[0] =~ /cdrom/ or $mnt[0] =~ /floppy/) {
      if member($facts['mountpoints'][$mnt[0]]['options'], 'nosuid') == false {
        notify { "1_1_19 nosuid ${mnt[0]}":
          message  => "POTENTIAL Not in compliance with CIS 9 (Not Scored). Ensure nosuid option set on removable media partitions - ${mnt[0]}",  #lint:ignore:140chars
          loglevel => 'warning',
        }
      }
    }
  }
}
