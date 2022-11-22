# @api private
#
# @summary Ensure SETroubleshoot is not installed 
#
class secure_linux_cis::rules::ensure_setroubleshoot_is_not_installed {
  case $facts['osfamily'] {
    'Suse': {
      package { 'setroubleshoot':
        ensure   => absent,
      }
    }
    default: {
      package { 'setroubleshoot':
        ensure   => absent,
      }
    }
  }
}
