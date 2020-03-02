# @api private
#  Ensure SETroubleshoot is not installed (Scored)
#
#
# Description:
# The SETroubleshoot service notifies desktop users of SELinux denials through a user- friendly interface. The service provides
# important information around configuration errors, unauthorized intrusions, and other potential errors.
#
# @summary  Ensure SETroubleshoot is not installed (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_setroubleshoot_is_not_installed
class secure_linux_cis::rules::ensure_setroubleshoot_is_not_installed(
    Boolean $enforced = true,
) {
  if $enforced {
    case $facts['osfamily'] {
      'Suse': {
        package { 'setroubleshoot':
          ensure   => absent,
          schedule => 'harden_schedule',
        }
      }
      default: {
        package { 'setroubleshoot':
          ensure   => purged,
          schedule => 'harden_schedule',
        }
      }
    }
  }
}
